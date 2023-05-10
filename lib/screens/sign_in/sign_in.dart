import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';
import 'package:shea/screens/sign_in/confirm_code.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class SheaSignIn extends HookConsumerWidget {
  const SheaSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final phoneController = useTextEditingController();
    const regionCode = CountryWithPhoneCode.us();
    final error = useState<String>("");

    return SheaCreateAccountLayout(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 8),
          child: const Text(
            "Enter your phone number",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
            "A verification code will be sent to this number.",
            style: TextStyle(fontSize: 12),
          ),
        ),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          inputFormatters: [
            LibPhonenumberTextFormatter(
              country: regionCode,
              inputContainsCountryCode: false,
            ),
          ],
        ),
        if (error.value.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              error.value,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        Expanded(
          child: (isLoading.value)
              ? const Center(child: CircularProgressIndicator())
              : Container(),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: SheaPrimaryButton(
            text: "Continue",
            onPressed: () async {
              try {
                isLoading.value = true;
                error.value = "";
                final number = formatNumberSync(
                    "+${regionCode.phoneCode} ${phoneController.text}");

                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: number,
                  verificationCompleted:
                      (PhoneAuthCredential credential) async {
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "home",
                        (route) => false,
                      );
                    }
                  },
                  verificationFailed: (FirebaseAuthException e) {
                    isLoading.value = false;
                    // Show error
                    if (e.code == 'invalid-phone-number') {
                      debugPrint('The provided phone number is not valid.');
                      return;
                    }
                    final errorStr = "Error: ${e.toString()}";
                    debugPrint(errorStr);
                    error.value = errorStr;
                  },
                  codeSent: (String verificationId, int? resendToken) async {
                    Navigator.pushNamed(
                      context,
                      SheaConfirmNumber.routeName,
                      arguments: SheaConfirmNumberArgs(
                        verificationId: verificationId,
                        resendToken: resendToken,
                      ),
                    );
                    isLoading.value = false;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    isLoading.value = false;
                    // Timedout
                    debugPrint("Timeout: $verificationId");
                  },
                );
              } catch (e) {
                isLoading.value = false;
                debugPrint(e.toString());
              }
            },
          ),
        ),
      ]),
    );
  }
}
