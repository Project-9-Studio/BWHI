import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SheaSelectSchoolPicker extends HookConsumerWidget {
  final String? school;
  final List<String> schools;
  final Function(String value)? onSelect;

  const SheaSelectSchoolPicker({
    Key? key,
    this.school,
    this.schools = const [],
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = school ?? "Select a university";
    const labelStyle = TextStyle(color: Colors.white);
    final List<Widget> schoolWidgets = List<Widget>.from(
      schools.map((e) => Center(child: Text(e, style: labelStyle))),
    );

    void showDialog() {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: Colors.black,
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                if (onSelect != null && index > 0) onSelect!(schools[index]);
              },
              children: schoolWidgets,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: showDialog,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
