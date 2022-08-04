import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shea/components/primary_button.dart';

class SheaOnboardBody extends StatelessWidget {
  final Widget? image;
  final String? title;
  final String? subtitle;
  final String? btnText;
  final double? activeProgress;
  final void Function()? onNextPress;

  const SheaOnboardBody({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
    this.btnText,
    this.onNextPress,
    this.activeProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: image,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          subtitle ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          child: DotsIndicator(
            dotsCount: 3,
            position: activeProgress ?? 0,
            decorator: const DotsDecorator(
              color: Colors.white, // Inactive color
              activeColor: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: SheaPrimaryButton(
            text: btnText ?? "",
            onPressed: onNextPress,
          ),
        ),
      ],
    );
  }
}
