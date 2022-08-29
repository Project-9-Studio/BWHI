import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/firebase_options.dart';

class SheaAppLanding extends HookConsumerWidget {
  const SheaAppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _init() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          Navigator.popAndPushNamed(context, 'onboard');
        } else {
          Navigator.popAndPushNamed(context, 'home');
        }
      });
    }

    useEffect(() {
      _init();
      return;
    });

    return const Center(child: CircularProgressIndicator());
  }
}
