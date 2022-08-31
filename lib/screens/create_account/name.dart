import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/user/profile.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaCreateName extends HookConsumerWidget {
  const SheaCreateName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final updateProfile = ref.read(userProvider.notifier).updateProfile;

    void onContinue() {
      Navigator.pushNamed(context, 'createAccount/email');
    }

    return SheaCreateAccountLayout(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 8),
          child: const Text(
            "Enter your full name",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          onChanged: (value) {
            updateProfile(SheaUserProfile(name: value));
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          keyboardType: TextInputType.name,
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: SheaPrimaryButton(
            text: "Continue",
            onPressed: (profile.name != null && profile.name!.isNotEmpty)
                ? onContinue
                : null,
          ),
        ),
      ]),
    );
  }
}
