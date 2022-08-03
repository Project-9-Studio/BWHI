import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/firebase_options.dart';

class SheaAppLanding extends HookConsumerWidget {
  const SheaAppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateHome() {
      Navigator.popAndPushNamed(context, 'onboard');
    }

    void _init() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      navigateHome();
    }

    useEffect(() {
      _init();
      return;
    });

    return const Center(child: CircularProgressIndicator());
  }
}
