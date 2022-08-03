import 'package:flutter/material.dart';
import 'package:shea/screens/create_account/app_bar.dart';

class SheaCreateAccountLayout extends StatelessWidget {
  final Widget? child;
  final bool showBackButton;

  const SheaCreateAccountLayout({
    Key? key,
    this.child,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SheaCreateAccountAppBar(showBackButton: showBackButton),
      backgroundColor: const Color(0xff50B8C2),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
          child: child,
        ),
      ),
    );
  }
}
