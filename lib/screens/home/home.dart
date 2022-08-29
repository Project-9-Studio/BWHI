import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/screens/home/app_bar.dart';

class SheaAppHome extends HookConsumerWidget {
  const SheaAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: SheaHomeAppBar(),
    );
  }
}
