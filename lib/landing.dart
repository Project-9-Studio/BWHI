import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/firebase_options.dart';
import 'package:shea/models/user/user.dart';

class SheaAppLanding extends HookConsumerWidget {
  const SheaAppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveAuth = ref.read(userProvider.notifier).setAuth;
    final fetchProfile = ref.read(userProvider.notifier).fetchProfile;
    void navigateAway(String path) => Navigator.popAndPushNamed(context, path);

    void init() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          saveAuth(SheaUser(user: user));
          final result = await fetchProfile();
          final path =
              (result.profile.id != null) ? "home" : "createAccount/name";
          return navigateAway(path);
        }

        navigateAway('onboard');
      });
    }

    useEffect(() {
      init();
      return;
    });

    return const Center(child: CircularProgressIndicator());
  }
}
