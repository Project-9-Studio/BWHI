import 'package:flutter/material.dart';
import 'package:shea/screens/onboarding/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaOnboardHome extends StatelessWidget {
  const SheaOnboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheaOnboardLayout(
      showAppBar: false,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40, top: 100),
            child: const Image(
              image: AssetImage('assets/images/intro01.png'),
              width: 188,
              height: 280,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const Text(
              "Welcome to SHEA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Colors.black,
              ),
            ),
          ),
          const Text(
            "Sistas Health Education Access",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: SheaPrimaryButton(
              text: "Get Started",
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, 'onboard/1');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "signIn");
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
