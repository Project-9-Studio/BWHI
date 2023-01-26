import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/screens/onboarding/layout.dart';
import 'package:shea/screens/onboarding/layout_body.dart';

final onboardingData = [
  {
    "image": const Image(image: AssetImage('assets/images/intro00.png')),
    "title": "Taking Charge",
    "subtitle":
        "We get it Sis!  Being a college student, is a lot. But prioritizing your health should be a non negotiable!",
    "btnText": "Next",
  },
  {
    "image": const Image(image: AssetImage('assets/images/intro02.png')),
    "title": "You are Here!",
    "subtitle":
        "Need to access care? Simply select your campus and be directed to a list of health services - from sexual health to mental health to crisis management.",
    "btnText": "Next",
  },
  {
    "image": const Image(image: AssetImage("assets/images/beAccountable.png")),
    "title": "Be Accountable",
    "subtitle":
        "The daily checklist encourages discipline and appreciation of some important habits to help you live your best life.",
    "btnText": "Next",
  },
  {
    "image": const Image(image: AssetImage("assets/images/intro03.png")),
    "title": "We got you",
    "subtitle":
        "We’ve pulled together a list of some really important information and resources to help you manage your health.",
    "btnText": "Next",
  },
  {
    "image": const Image(image: AssetImage("assets/images/intro04.png")),
    "title": "Ring the Alarm!",
    "subtitle":
        "The built-in appointment reminder helps you keep track of your annual exams, monthly self-breast exam, or any upcoming clinic visits.",
    "btnText": "Continue",
  }
];

class SheaOnboard1 extends HookConsumerWidget {
  const SheaOnboard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = useState(0);

    return SheaOnboardLayout(
      child: SheaOnboardBody(
        image: onboardingData[activeIndex.value]["image"] as Widget,
        title: onboardingData[activeIndex.value]["title"] as String,
        subtitle: onboardingData[activeIndex.value]["subtitle"] as String,
        btnText: onboardingData[activeIndex.value]["btnText"] as String,
        activeProgress: double.parse(activeIndex.value.toString()),
        onForwardSwipe: () {
          if (activeIndex.value > 0) activeIndex.value -= 1;
        },
        onBackSwipe: () {
          if (activeIndex.value < 2) activeIndex.value += 1;
        },
        onNextPress: () {
          switch (activeIndex.value) {
            case 0:
            case 1:
            case 2:
            case 3:
              {
                activeIndex.value += 1;
              }
              break;
            case 4:
              Navigator.pushNamed(context, 'createAccount');
              break;
          }
        },
      ),
    );
  }
}
