import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SheaReminderModal extends HookConsumerWidget {
  final String? imageUrl;
  final String? title;
  final String? body;

  const SheaReminderModal({
    super.key,
    this.imageUrl,
    this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: (imageUrl != null) ? 558 : 450,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageUrl != null)
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Image.network(imageUrl!, width: 180, height: 210),
            ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 36),
            child: Text(
              body ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff757773),
              ),
            ),
          )
        ],
      ),
    );
  }
}
