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
            "https://firebasestorage.googleapis.com/v0/b/shea-ac999.appspot.com/o/images%2Fdaily-checklist%2Fmind.png?alt=media&token=192bb4cd-f098-4c99-8ff6-e754d26cc87f",
        description:
            "Spend at least 15 minutes taking some deep breaths, meditating, and relaxing.",
      ),
      SheaDailyChecklistItem(
        id: "2",
        title: "Move your body",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/shea-ac999.appspot.com/o/images%2Fdaily-checklist%2FmoveBody.png?alt=media&token=bd6d0914-4f77-414c-9799-bb135166defa",
        description:
            "Take a short walk, get at least 30 minutes of physical activity.",
      ),
      SheaDailyChecklistItem(
        id: "3",
        title: "Hydrate to Heal",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/shea-ac999.appspot.com/o/images%2Fdaily-checklist%2Fhydrate.png?alt=media&token=b56c65fb-e2ca-4ee3-a826-6a54c1bb9eff",
        description: "Drink at least 1 glass of water with every meal.",
      ),
      SheaDailyChecklistItem(
        id: "4",
        title: "Nourish your Soul ",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/shea-ac999.appspot.com/o/images%2Fdaily-checklist%2FnourishSoul.png?alt=media&token=4073f92b-1892-4ee8-b30b-aa89b0095d62",
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
