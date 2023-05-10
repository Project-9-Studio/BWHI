import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/newSchool_submit.dart';
import 'package:shea/models/school.dart';
import 'package:shea/models/user/user.dart';

class SheaSelectSchoolPicker extends HookConsumerWidget {
  final String? school;
  final Widget? widget;
  final bool? showNotification;
  final Function(String value)? onSelect;

  final String noSchoolText = "I don’t see my school";

  const SheaSelectSchoolPicker({
    Key? key,
    this.school,
    this.onSelect,
    this.widget,
    this.showNotification = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noSchoolValue = useState("Select a university");
    final schools = ref.watch(schoolsProvider).getSchoolsList();
    final school = ref.read(userProvider).profile.school;
    final updateProfile = ref.read(userProvider.notifier).changeSchool;
    final fetchSchools = ref.read(schoolsProvider.notifier).fetchSchools;
    final value = school ?? "Select a university";
    const labelStyle = TextStyle(color: Colors.white);
    schools.sort((a, b) => a.name!.compareTo(b.name!));
    final List<Widget> schoolWidgets = [
      const Center(child: Text("Select University", style: labelStyle)),
      ...List<Widget>.from(
        schools.map((e) => Center(child: Text(e.name!, style: labelStyle))),
      ),
      Center(child: Text(noSchoolText, style: labelStyle)),
      const Center(child: Text("I’m not in school", style: labelStyle)),
    ];

    useEffect(() {
      fetchSchools(school: school);
      return;
    }, []);

    void showFormModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) => const NewSchoolForm(),
      );
    }

    void showFormDialogModal() {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => Container(
          height: 390,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: const Text(
                "Would you like to request to add your school?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showFormModal();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const Text(
                  'No',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    }

    void showDialog() {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => Container(
          height: 364,
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
            child: Column(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      final school = (index > 0 && index <= schools.length)
                          ? schools[index - 1].name
                          : null;
                      updateProfile(school: school);
                      if (school == null) {
                        if (index == 0) {
                          noSchoolValue.value = "Select a university";
                        } else if (index == schoolWidgets.length - 1) {
                          noSchoolValue.value = noSchoolText;
                        } else if (index == schoolWidgets.length - 2) {
                          noSchoolValue.value = "I don't see my school";
                        }
                      } else {
                        noSchoolValue.value = "";
                      }
                    },
                    children: schoolWidgets,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      if (noSchoolValue.value == "Select a university") return;
                      if (noSchoolValue.value.isNotEmpty) {
                        await Future.delayed(
                          const Duration(milliseconds: 500),
                        );
                        showFormDialogModal();
                      } else if (showNotification != null &&
                          showNotification != false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: const Color(0xff334C8D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).size.height - 200,
                            ),
                            content: Container(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: Image.asset(
                                      "assets/images/check-circle.png",
                                    ),
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "You can now access this school from the Home screen",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final defaultWidget = Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        (noSchoolValue.value.isNotEmpty) ? noSchoolValue.value : value,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    return GestureDetector(
      onTap: showDialog,
      child: widget ?? defaultWidget,
    );
  }
}
