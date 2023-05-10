import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shea/models/user/dailychecklist.dart';
import 'package:shea/models/user/profile.dart';

// Auth state
@immutable
class SheaUser {
  final User? user;
  final SheaUserProfile profile;
  final SheaUserDailyChecklist dailyChecklist;

  const SheaUser({
    this.user,
    this.profile = const SheaUserProfile(),
    this.dailyChecklist = const SheaUserDailyChecklist(),
  });

  SheaUser copyWith(SheaUser auth) {
    return SheaUser(
      user: auth.user ?? user,
      profile: profile.copyWith(auth.profile),
      dailyChecklist: dailyChecklist.copyWith(auth.dailyChecklist),
    );
  }
}

class SheaUserNotifier extends StateNotifier<SheaUser> {
  // We initialize
  SheaUserNotifier() : super(const SheaUser());

  // Sign user in with phone credentials
  Future<SheaUser> signIn(PhoneAuthCredential credential) async {
    try {
      final auth = FirebaseAuth.instance;
      final creds = await auth.signInWithCredential(credential);
      state = state.copyWith(SheaUser(user: creds.user));
    } catch (e) {
      debugPrint(e.toString());
    }
    return state;
  }

  // Verify sms code sent to phone
  Future<SheaUser> confirmCode(String verificationId, String code) async {
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
      state = state.copyWith(SheaUser(user: creds.user));
      await fetchProfile();
    } catch (e) {
      debugPrint(e.toString());
    }

    return state;
  }

  Future<SheaUser> fetchProfile() async {
    final db = FirebaseFirestore.instance;
    final id = state.user?.uid;
    final profile = await db.collection("users").doc(id).get();

    if (profile.exists) {
      final data = profile.data();
      final checkItems = Map<String, Timestamp>.from(
        data?["dailyCheckItems"] ?? {},
      );
      state = state.copyWith(
        SheaUser(
          profile: SheaUserProfile.fromMap(data),
          dailyChecklist: SheaUserDailyChecklist.fromTimestamps(checkItems),
        ),
      );
    }

    return state;
  }

  Future<SheaUser> saveProfileImage(XFile file) async {
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

  Future<SheaUser> saveProfile() async {
    try {
      final db = FirebaseFirestore.instance;

      // Ensure id is set to logged in user uid
      updateProfile(SheaUserProfile(id: state.user?.uid));

      await db.collection('users').doc(state.user?.uid).set({
        ...state.profile.toMap(),
        "dailyCheckItems": state.dailyChecklist.items
      });
    } catch (e) {
      debugPrint("Could not save profile: ${e.toString()}");
    }
    return state;
  }

  Future<SheaUser> saveFCMToken(String? token) async {
    try {
      final db = FirebaseFirestore.instance;
      await db
          .collection('users')
          .doc(state.user?.uid)
          .set({...state.profile.toMap(), "fcmToken": token});
    } catch (e) {
      debugPrint("Could not save profile: ${e.toString()}");
    }
    return state;
  }

  SheaUser updateProfile(SheaUserProfile profile) {
    state = state.copyWith(SheaUser(profile: profile));
    return state;
  }

  SheaUser changeSchool({String? school}) {
    state = state.copyWith(
      SheaUser(profile: state.profile.changeSchool(school)),
    );
    return state;
  }

  SheaUser setAuth(SheaUser auth) {
    state = auth;
    return state;
  }

  SheaUser updateDailyCheckItem(String id, bool value) {
    if (value) {
      state = state.copyWith(SheaUser(
        dailyChecklist: SheaUserDailyChecklist(items: {id: DateTime.now()}),
      ));
    } else {
      final newState = state.copyWith(state);
      newState.dailyChecklist.items.remove(id);
      state = newState;
    }

    saveProfile();
    return state;
  }
}

final userProvider = StateNotifierProvider<SheaUserNotifier, SheaUser>((ref) {
  return SheaUserNotifier();
});
