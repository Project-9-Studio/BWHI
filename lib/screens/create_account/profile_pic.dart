import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/app.dart';
import 'package:shea/models/auth.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaProfilePic extends HookConsumerWidget {
  const SheaProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(authProvider).profile;
    final saveProfileImage = ref.read(authProvider.notifier).saveProfileImage;
    final isLoading = useState(false);

    void navigateAway() {
      Navigator.pushNamed(context, "createAccount/selectSchool");
    }

    void onProfileTap() async {
      final file = await SheaApp.pickImage();
      if (file != null) {
        isLoading.value = true;
        await saveProfileImage(file);
        isLoading.value = false;
      }
    }

    return SheaCreateAccountLayout(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 35),
          child: const Text(
            "Add profile photo?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: onProfileTap,
          child: CircleAvatar(
              backgroundColor: const Color(0xffECECEC),
              maxRadius: 75,
              foregroundImage:
                  (!isLoading.value && profile.profileImageURL != null)
                      ? NetworkImage(profile.profileImageURL!)
                      : null,
              child:
                  (isLoading.value) ? const CircularProgressIndicator() : null),
        ),
        const Spacer(),
        GestureDetector(
          onTap: navigateAway,
          child: const Text(
            "Skip for now",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 25, bottom: 50),
          child: SheaPrimaryButton(
            text: "Continue",
            onPressed: (profile.email != null && profile.email!.isNotEmpty)
                ? navigateAway
                : null,
          ),
        ),
      ]),
    );
  }
}
