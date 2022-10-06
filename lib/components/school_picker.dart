import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/school.dart';
import 'package:shea/models/user/profile.dart';
import 'package:shea/models/user/user.dart';

class SheaSelectSchoolPicker extends HookConsumerWidget {
  final String? school;
  final Widget? widget;
  final Function(String value)? onSelect;

  const SheaSelectSchoolPicker({
    Key? key,
    this.school,
    this.onSelect,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schools = ref.watch(schoolsProvider).getSchoolsList();
    final school = ref.read(userProvider).profile.school;
    final updateProfile = ref.read(userProvider.notifier).updateProfile;
    final fetchSchools = ref.read(schoolsProvider.notifier).fetchSchools;
    final value = school ?? "Select a university";
    const labelStyle = TextStyle(color: Colors.white);
    final List<Widget> schoolWidgets = [
      const Center(child: Text("Select University", style: labelStyle)),
      ...List<Widget>.from(
        schools.map((e) => Center(child: Text(e.name!, style: labelStyle))),
      )
    ];

    useEffect(() {
      fetchSchools();
    }, []);

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
                if (onSelect != null && index > 0) {
                  onSelect!(schools[index - 1].name!);
                  debugPrint(index.toString());
                  updateProfile(
                    SheaUserProfile(school: schools[index - 1].name!),
                  );
                }
              },
              children: schoolWidgets,
            ),
          ),
        ),
      );
    }

    final defaultWidget = Container(
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
    );

    return GestureDetector(
      onTap: showDialog,
      child: widget ?? defaultWidget,
    );
  }
}
