import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/settings_appbar.dart';

class SheaNotificationsView extends HookConsumerWidget {
  const SheaNotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const labelStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w500);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SheaSettingsAppBar(title: "Notifications"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  const Text("System Notifications", style: labelStyle),
                  const Spacer(),
                  CupertinoSwitch(value: true, onChanged: (value) {})
                ],
              ),
            ),
            Row(
              children: [
                const Text("Reminders Notifications", style: labelStyle),
                const Spacer(),
                CupertinoSwitch(value: true, onChanged: (value) {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
