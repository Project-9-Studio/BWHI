import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/app_bar.dart';

class SheaOnboardLayout extends StatelessWidget {
  final Widget? child;
  const SheaOnboardLayout({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SheaOnboardAppBar(),
      backgroundColor: const Color(0xff50B8C2),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 27),
          child: child,
        ),
      ),
    );
  }
}
