import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/user/user.dart';
import 'package:shea/screens/home/campus_health.dart';
import 'package:shea/screens/home/checklist.dart';

class SheaAppHomeView extends HookConsumerWidget {
  const SheaAppHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final school = ref.watch(userProvider).profile.school;
    final hasSchool = school != null && school.isNotEmpty;
    final labelStyle = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return DefaultTabController(
      length: hasSchool ? 2 : 1,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(
              labelStyle: labelStyle,
              unselectedLabelStyle: labelStyle,
              indicatorColor: Colors.white,
              tabs: [
                const Tab(icon: Text("Checklist")),
                if (hasSchool) const Tab(icon: Text("Campus Health")),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                const SheaDailyChecklist(),
                if (hasSchool) const SheaCampusHealth(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
