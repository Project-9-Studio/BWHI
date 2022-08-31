// User profile
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class SheaUserDailyChecklist {
  final Map<String, DateTime> items;

  const SheaUserDailyChecklist({this.items = const {}});

  SheaUserDailyChecklist copyWith(SheaUserDailyChecklist checklist) {
    return SheaUserDailyChecklist(items: {...items, ...checklist.items});
  }

  DateTime? getItem(String id) {
    return items[id];
  }

  static bool isExpired(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return DateTime(date.year, date.month, date.day) != today;
  }

  static SheaUserDailyChecklist fromTimestamps(Map<String, Timestamp> data) {
    return SheaUserDailyChecklist(
      items: data.map((key, value) => MapEntry(key, value.toDate())),
    );
  }

  @override
  String toString() {
    return items.toString();
  }
}
