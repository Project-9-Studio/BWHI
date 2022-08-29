import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shea/landing.dart';
import 'package:shea/screens/create_account/create_acount.dart';
import 'package:shea/screens/create_account/email.dart';
import 'package:shea/screens/create_account/name.dart';
import 'package:shea/screens/create_account/profile_pic.dart';
import 'package:shea/screens/create_account/select_school.dart';
import 'package:shea/screens/onboarding/main.dart';
import 'package:shea/screens/onboarding/onboard1.dart';
import 'package:shea/screens/onboarding/onboard2.dart';
import 'package:shea/screens/onboarding/onboard3.dart';
import 'package:shea/screens/sign_in/confirm_code.dart';
import 'package:shea/screens/sign_in/sign_in.dart';

class SheaApp extends StatelessWidget {
  const SheaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shea",
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme),
      ),
      home: const SheaAppLanding(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "onboard":
            return MaterialPageRoute(builder: (_) => const SheaOnboardHome());
          case "onboard/1":
            return MaterialPageRoute(builder: (_) => const SheaOnboard1());
          case "onboard/2":
            return MaterialPageRoute(builder: (_) => const SheaOnboard2());
          case "onboard/3":
            return MaterialPageRoute(builder: (_) => const SheaOnboard3());
          case "signIn":
            return MaterialPageRoute(builder: (_) => const SheaSignIn());
          case "createAccount":
            return MaterialPageRoute(builder: (_) => const SheaCreateAccount());
          case SheaConfirmNumber.routeName:
            final args = settings.arguments as SheaConfirmNumberArgs;

            return MaterialPageRoute(
              builder: (_) => SheaConfirmNumber(
                verificationId: args.verificationId,
                resendToken: args.resendToken,
              ),
            );
          case "createAccount/name":
            return MaterialPageRoute(builder: (_) => const SheaCreateName());
          case "createAccount/email":
            return MaterialPageRoute(builder: (_) => const SheaCreateEmail());
          case "createAccount/profile_pic":
            return MaterialPageRoute(builder: (_) => const SheaProfilePic());
          case "createAccount/selectSchool":
            return MaterialPageRoute(builder: (_) => const SheaSelectSchool());
          default:
            return null;
        }
      },
    );
  }
}
