import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/app_bar.dart';

class SheaOnboardLayout extends StatelessWidget {
  final Widget? child;
  final bool showAppBar;
  final void Function()? onBackSwipe;
  final void Function()? onForwardSwipe;

  const SheaOnboardLayout({
    Key? key,
    this.child,
    this.showAppBar = true,
    this.onBackSwipe,
    this.onForwardSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (showAppBar) ? const SheaOnboardAppBar() : null,
      backgroundColor: const Color(0xff50B8C2),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null &&
              details.primaryVelocity! < 0 &&
              onBackSwipe != null) {
            onBackSwipe!();
          } else if (onForwardSwipe != null) {
            onForwardSwipe!();
          }
        },
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: child,
          ),
        ),
      ),
    );
  }
}
