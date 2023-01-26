import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/profile_avatar.dart';
import 'package:shea/components/settings_appbar.dart';
import 'package:shea/components/text_input.dart';
import 'package:shea/models/user/profile.dart';
import 'package:shea/models/user/user.dart';

class SheaProfileView extends HookConsumerWidget {
  const SheaProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final updateProfile = ref.read(userProvider.notifier).updateProfile;
    final isEditing = useState(false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SheaSettingsAppBar(
        title: "Profile",
        actions: [
          if (!isEditing.value)
            TextButton(
              onPressed: () {
                isEditing.value = !isEditing.value;
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0F4C82),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 40),
              child: const SheaEditProfileAvatar(width: 100, height: 100),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: SheaTextInput(
                initialValue: profile.name,
                label: "Full name",
                enabled: isEditing.value,
                onChanged: (value) => updateProfile(
                  SheaUserProfile(name: value),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: SheaTextInput(
                initialValue: profile.email,
                label: "Email address",
                enabled: isEditing.value,
                onChanged: (value) => updateProfile(
                  SheaUserProfile(email: value),
                ),
              ),
            ),
            SheaTextInput(
              initialValue: FirebaseAuth.instance.currentUser?.phoneNumber,
              label: "Phone Number",
              enabled: false,
            ),
            const Spacer(),
            if (isEditing.value)
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC41C),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    isEditing.value = false;
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
