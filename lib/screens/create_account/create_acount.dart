import 'package:flutter/material.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaCreateAccount extends StatelessWidget {
  const SheaCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheaCreateAccountLayout(
      showAppBar: false,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 40),
          child: Image.asset('assets/images/createAccount.png'),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const Text(
            "Create an Account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          "Learn where to find health services available on your college campus",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(top: 45, bottom: 20),
          child: SheaPrimaryButton(
            text: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, 'signIn');
            },
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'signIn');
          },
          child: const Text(
            "Already have an account",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
