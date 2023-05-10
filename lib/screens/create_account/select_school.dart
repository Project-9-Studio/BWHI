import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/school_picker.dart';
import 'package:shea/models/user/profile.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaSelectSchool extends HookConsumerWidget {
  const SheaSelectSchool({Key? key}) : super(key: key);
  static const defaultSchoolSelect = "Select a university";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final updateProfile = ref.read(userProvider.notifier).updateProfile;
    final saveProfile = ref.read(userProvider.notifier).saveProfile;
    final school = profile.school ?? defaultSchoolSelect;
    final isLoading = useState(false);
    const loader = Center(child: CircularProgressIndicator());

    void navigateHome() =>
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);

    void onContinue() async {
      try {
        isLoading.value = true;
        await saveProfile();
        navigateHome();
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return SheaCreateAccountLayout(
      child: (isLoading.value)
          ? loader
          : Column(children: [
              Expanded(
                child: Center(
                  child: SheaSelectSchoolPicker(
                    school: school,
                    showNotification: false,
                    onSelect: (value) => updateProfile(
                      SheaUserProfile(school: value),
                    ),
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
