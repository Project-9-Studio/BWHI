import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/auth.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaCreateName extends HookConsumerWidget {
  const SheaCreateName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = useTextEditingController();
    final updateProfile = ref.read(authProvider.notifier).updateProfile;

    void onContinue() {
      updateProfile(SheaUserProfile(name: nameCtrl.text));
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
          controller: nameCtrl,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          keyboardType: TextInputType.name,
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: SheaPrimaryButton(
            text: "Continue",
            onPressed: (nameCtrl.value.text.isNotEmpty) ? onContinue : null,
          ),
        ),
      ]),
    );
  }
}
