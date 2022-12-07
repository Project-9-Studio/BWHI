import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/school.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/screens/home/service_cards.dart';

class SheaCampusHealth extends HookConsumerWidget {
  const SheaCampusHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final getSchoolByName = ref.watch(schoolsProvider).getSchoolByName;
    final school = getSchoolByName(name: profile.school) ?? const SheaSchool();
    final fetchSchools = ref.read(schoolsProvider.notifier).fetchSchools;

    useEffect(() {
      if (profile.school != null &&
          profile.school!.isNotEmpty &&
          school.services.isEmpty) {
        fetchSchools(school: profile.school);
      }
      return;
    }, [profile.school]);

    return SingleChildScrollView(
        child: Column(
      children: [
        SheaSchoolServicesCards(school: school),
        /* Container(
          margin: const EdgeInsets.only(
            top: 18,
            left: 12,
            right: 12,
            bottom: 18,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 7),
                  child: const HeroIcon(
                    HeroIcons.calendar,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Add Appointment to Calendar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        )*/
      ],
    ));
  }
}
