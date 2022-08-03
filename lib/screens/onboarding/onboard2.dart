import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/layout.dart';
import 'package:shea/screens/onboarding/layout_body.dart';

class SheaOnboard2 extends StatelessWidget {
  const SheaOnboard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheaOnboardLayout(
      child: SheaOnboardBody(
        image: const Image(
          image: AssetImage("assets/images/intro03.png"),
        ),
        title: "Help a Sister Out!",
        subtitle:
            "Student health and counseling centers are there for you - providing an array of important services to help you manage your health.",
        btnText: "Next",
        activeProgress: 1,
        onNextPress: () => Navigator.pushNamed(context, 'onboard/3'),
      ),
    );
  }
}
