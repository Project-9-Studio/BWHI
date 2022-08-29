import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/school_picker.dart';
import 'package:shea/models/auth.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaSelectSchool extends HookConsumerWidget {
  const SheaSelectSchool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(authProvider).profile;
    final updateProfile = ref.read(authProvider.notifier).updateProfile;
    final school = profile.school ?? "Select a university";

    void onContinue() {
      //Navigator.pushNamed(context, 'createAccount/email');
    }

    return SheaCreateAccountLayout(
      child: Column(children: [
        Expanded(
          child: Center(
            child: SheaSelectSchoolPicker(
              school: school,
              schools: const ["Select A University", "Clark Atlanta"],
              onSelect: (value) =>
                  updateProfile(SheaUserProfile(school: value)),
            ),
          ),
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
