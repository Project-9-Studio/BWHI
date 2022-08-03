import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/layout.dart';
import 'package:shea/screens/onboarding/layout_body.dart';

class SheaOnboard1 extends StatelessWidget {
  const SheaOnboard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheaOnboardLayout(
      child: SheaOnboardBody(
        image: const Image(
          image: AssetImage('assets/images/intro02.png'),
        ),
        title: "You are Here!",
        subtitle:
            "Need to access care? Simply select your campus and be directed to a list of health services - from sexual health to mental health to crisis management.",
        btnText: "Next",
        activeProgress: 0,
        onNextPress: () => Navigator.pushNamed(context, 'onboard/2'),
      ),
    );
  }
}
