import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/user/dailychecklist.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/models/checklist.dart';

class SheaDailyChecklist extends StatelessWidget {
  const SheaDailyChecklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checklist = SheaDailyChecklistItem.getDefaultChecklist();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Text(
              "Daily Checklist",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          ...checklist.map((e) => SheaChecklistItem(item: e))
        ],
      ),
    );
  }
}

class SheaChecklistItem extends HookConsumerWidget {
  final SheaDailyChecklistItem item;
  const SheaChecklistItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCheckedItems = ref.watch(userProvider).dailyChecklist.items;
    final updateItem = ref.read(userProvider.notifier).updateDailyCheckItem;
    final checkedItem = userCheckedItems[item.id];
    final isSelected = (checkedItem != null)
        ? !SheaUserDailyChecklist.isExpired(checkedItem)
        : false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 98,
                  height: 98,
                  margin: const EdgeInsets.only(right: 16),
                  child: (item.imageUrl != null)
                      ? Image.network(item.imageUrl!)
                      : null,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        item.description ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFB3B3B3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: (isSelected) ? const Color(0xFFF1B3DC) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Checkbox(
            shape: const CircleBorder(),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFFF1B3DC);
                }
                return Colors.transparent;
              },
            ),
            checkColor: Colors.black,
            value: isSelected,
            onChanged: (val) {
              if (val != null) updateItem(item.id, val);
            },
          ),
        )
      ],
    );
  }
}

bool isTimestampGood(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  return DateTime(date.year, date.month, date.day) == today;
}
