// User profile
import 'package:flutter/foundation.dart';

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
