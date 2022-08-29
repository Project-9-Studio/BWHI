import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// Auth state
@immutable
class SheaAuth {
  final User? user;
  final SheaUserProfile profile;

  const SheaAuth({this.user, this.profile = const SheaUserProfile()});

  SheaAuth copyWith(SheaAuth auth) {
    return SheaAuth(
      user: auth.user ?? user,
      profile: profile.copyWith(auth.profile),
    );
  }
}

// User profile
@immutable
class SheaUserProfile {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImageURL;
  final String? school;

  const SheaUserProfile({
    this.id,
    this.name,
    this.email,
    this.profileImageURL,
    this.school,
  });

  SheaUserProfile copyWith(SheaUserProfile profile) {
    return SheaUserProfile(
      id: profile.id ?? id,
      name: profile.name ?? name,
      email: profile.email ?? email,
      profileImageURL: profile.profileImageURL ?? profileImageURL,
      school: profile.school ?? school,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "profileImageURL": profileImageURL,
      "school": school,
    };
  }

  static SheaUserProfile fromMap(data) {
    return SheaUserProfile(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      profileImageURL: data["profileImageURL"],
      school: data["school"],
    );
  }
}

class SheaAuthNotifier extends StateNotifier<SheaAuth> {
  // We initialize
  SheaAuthNotifier() : super(const SheaAuth());

  // Sign user in with phone credentials
  Future<SheaAuth> signIn(PhoneAuthCredential credential) async {
    try {
      final auth = FirebaseAuth.instance;
      final creds = await auth.signInWithCredential(credential);
      state = state.copyWith(SheaAuth(user: creds.user));
    } catch (e) {
      debugPrint(e.toString());
    }
    return state;
  }

  // Verify sms code sent to phone
  Future<SheaAuth> confirmCode(String verificationId, String code) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      // Sign the user in (or link) with the credential
      final creds = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      state = state.copyWith(SheaAuth(user: creds.user));
      await fetchProfile();
    } catch (e) {
      debugPrint(e.toString());
    }

    return state;
  }

  Future<SheaAuth> fetchProfile() async {
    final db = FirebaseFirestore.instance;
    final id = state.user?.uid;
    final profile = await db.collection("users").doc(id).get();

    if (profile.exists) {
      state = state.copyWith(
        SheaAuth(profile: SheaUserProfile.fromMap(profile.data())),
      );
    }

    return state;
  }

  Future<SheaAuth> saveProfileImage(XFile file) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final profileRef = storageRef.child("images/profile/${state.user?.uid}");
      await profileRef.putFile(File(file.path));
      final url = await profileRef.getDownloadURL();
      updateProfile(SheaUserProfile(profileImageURL: url));
      return state;
    } catch (e) {
      debugPrint("Could not save image: ${e.toString()}");
    }
    return state;
  }

  Future<SheaAuth> saveProfile() async {
    try {
      final db = FirebaseFirestore.instance;

      // Ensure id is set to logged in user uid
      updateProfile(SheaUserProfile(id: state.user?.uid));

      await db
          .collection('users')
          .doc(state.user?.uid)
          .set(state.profile.toMap());
    } catch (e) {
      debugPrint("Could not save profile: ${e.toString()}");
    }
    return state;
  }

  SheaAuth updateProfile(SheaUserProfile profile) {
    state = state.copyWith(SheaAuth(profile: profile));
    return state;
  }

  SheaAuth setAuth(SheaAuth auth) {
    state = auth;
    return state;
  }
}

final authProvider = StateNotifierProvider<SheaAuthNotifier, SheaAuth>((ref) {
  return SheaAuthNotifier();
});
