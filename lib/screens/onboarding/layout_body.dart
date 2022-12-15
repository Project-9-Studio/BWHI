import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shea/components/primary_button.dart';

class SheaOnboardBody extends StatelessWidget {
  final Widget? image;
  final String? title;
  final String? subtitle;
  final String? btnText;
  final double? activeProgress;
  final void Function()? onBackSwipe;
  final void Function()? onForwardSwipe;
  final void Function()? onNextPress;

  const SheaOnboardBody({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
    this.btnText,
    this.onNextPress,
    this.activeProgress,
    this.onBackSwipe,
    this.onForwardSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        EasyDebounce.debounce(
          'next',
          const Duration(milliseconds: 200),
          () {
            if (details.delta.dx < 0 && onBackSwipe != null) {
              onBackSwipe!();
            } else if (onForwardSwipe != null) {
              onForwardSwipe!();
            }
          },
        );
      },
      child: Column(
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
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            child: DotsIndicator(
              dotsCount: 5,
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
      ),
    );
  }
}
