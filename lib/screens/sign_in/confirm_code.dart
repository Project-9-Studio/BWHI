import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/screens/create_account/layout.dart';
import 'package:shea/components/primary_button.dart';

class SheaConfirmNumberArgs {
  final String verificationId;
  final int? resendToken;

  SheaConfirmNumberArgs({required this.verificationId, this.resendToken});
}

class SheaConfirmNumber extends HookConsumerWidget {
  final String verificationId;
  final int? resendToken;

  const SheaConfirmNumber({
    Key? key,
    required this.verificationId,
    this.resendToken,
  }) : super(key: key);

  static const routeName = '/confirmNumber';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final smsCode = useState("");
    final confirmCode = ref.read(userProvider.notifier).confirmCode;

    void submitCode() async {
      isLoading.value = true;
      final auth = await confirmCode(verificationId, smsCode.value);
      final path = (auth.profile.id != null) ? 'home' : 'createAccount/name';
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
      }
    }

    return SheaCreateAccountLayout(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 8),
          child: const Text(
            "Enter your verification code",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
            "Enter the code sent to your phone number.",
            style: TextStyle(fontSize: 12),
          ),
        ),
        PinCodeTextField(
          appContext: context,
          autoFocus: true,
          enablePinAutofill: true,
          length: 6,
          keyboardType: TextInputType.number,
          cursorColor: Colors.black,
          pinTheme: const PinTheme.defaults(
            activeColor: Colors.black,
            selectedColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          onCompleted: (code) async {
            FocusManager.instance.primaryFocus?.unfocus();
            smsCode.value = code;
          },
          onChanged: (value) {},
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
            onPressed: (smsCode.value.isNotEmpty) ? submitCode : null,
          ),
        ),
      ]),
    );
  }
}
