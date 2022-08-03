import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/layout.dart';
import 'package:shea/screens/onboarding/layout_body.dart';

class SheaOnboard3 extends StatelessWidget {
  const SheaOnboard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheaOnboardLayout(
      child: SheaOnboardBody(
        image: const Image(
          image: AssetImage("assets/images/intro04.png"),
        ),
        title: "Ring the Alarm!",
        subtitle:
            "The built-in appointment reminder helps you keep track of your annual exams, monthly self-breast exam, or any upcoming clinic visits.",
        btnText: "Continue",
        activeProgress: 2,
        onNextPress: () {
          Navigator.pushNamed(context, 'createAccount');
        },
      ),
    );
  }
}
