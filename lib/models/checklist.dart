import 'package:flutter/foundation.dart';

@immutable
class SheaDailyChecklistItem {
  final String id;
  final String title;
  final String? description;
  final String? imageUrl;

  const SheaDailyChecklistItem({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
  });

  static List<SheaDailyChecklistItem> getDefaultChecklist() {
    return const [
      SheaDailyChecklistItem(
        id: "1",
        title: "Take a Mindful Moment",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/ooot-bwhi.appspot.com/o/images%2Fdaily-checklist%2Fwalk.png?alt=media&token=a59d0df2-5d9d-489d-9661-30b99047ddec",
        description:
            "Spend at least 15 minutes taking some deep breaths, meditating, and relaxing.",
      ),
      SheaDailyChecklistItem(
        id: "2",
        title: "Move your body",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/ooot-bwhi.appspot.com/o/images%2Fdaily-checklist%2Fstretch.png?alt=media&token=4cec9ec7-5691-4e41-9676-3ed6ec08abd1",
        description:
            "Take a short walk, get at least 30 minutes of physical activity.",
      ),
      SheaDailyChecklistItem(
        id: "3",
        title: "Hydrate to Heal",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/ooot-bwhi.appspot.com/o/images%2Fdaily-checklist%2Fwater.png?alt=media&token=34980425-3923-4ef1-be1c-1288b24e152a",
        description: "Drink at least 1 glass of water with every meal.",
      ),
      SheaDailyChecklistItem(
        id: "4",
        title: "Nourish your Soul ",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/ooot-bwhi.appspot.com/o/images%2Fdaily-checklist%2Fmeditate.png?alt=media&token=c4ffd453-f3c2-497e-8a47-67b9a6492072",
        description:
            "Enjoy a serving of fresh fruit or vegetables with at least one meal.",
      ),
    ];
  }
}

@immutable
class SheaUserDailyItem {
  final String id;
  final DateTime lastChecked;

  const SheaUserDailyItem({required this.id, required this.lastChecked});
}
