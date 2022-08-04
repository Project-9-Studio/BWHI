import 'package:flutter/material.dart';
import 'package:shea/screens/create_account/app_bar.dart';

class SheaCreateAccountLayout extends StatelessWidget {
  final Widget? child;
  final bool showBackButton;
  final bool showAppBar;

  const SheaCreateAccountLayout({
    Key? key,
    this.child,
    this.showBackButton = true,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: (showAppBar)
            ? SheaCreateAccountAppBar(showBackButton: showBackButton)
            : null,
        backgroundColor: const Color(0xff50B8C2),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: child,
          ),
        ),
      ),
    );
  }
}
