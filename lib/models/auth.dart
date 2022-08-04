import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Auth state
@immutable
class SheaAuth {
  final UserCredential? creds;
  final SheaUserProfile profile;

  const SheaAuth({this.creds, this.profile = const SheaUserProfile()});

  SheaAuth copyWith(SheaAuth auth) {
    return SheaAuth(
      creds: auth.creds ?? creds,
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

  const SheaUserProfile({this.id, this.name, this.email});

  SheaUserProfile copyWith(SheaUserProfile profile) {
    return SheaUserProfile(
      id: profile.id ?? id,
      name: profile.name ?? name,
      email: profile.name ?? email,
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
      state = state.copyWith(SheaAuth(creds: creds));
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
      state = state.copyWith(SheaAuth(creds: creds));
      await fetchProfile();
    } catch (e) {
      debugPrint(e.toString());
    }

    return state;
  }

  Future<SheaAuth> fetchProfile() async {
    final db = FirebaseFirestore.instance;
    final id = state.creds?.user?.uid;
    final profile = await db.collection("users").doc(id).get();

    if (profile.exists) {
      state = state.copyWith(
        SheaAuth(profile: profile as SheaUserProfile),
      );
    }

    return state;
  }

  SheaAuth updateProfile(SheaUserProfile profile) {
    state = state.copyWith(SheaAuth(profile: profile));
    return state;
  }
}

final authProvider = StateNotifierProvider<SheaAuthNotifier, SheaAuth>((ref) {
  return SheaAuthNotifier();
});
