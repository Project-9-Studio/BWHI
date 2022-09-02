import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/screens/home/campus_health.dart';
import 'package:shea/screens/home/checklist.dart';

class SheaAppHomeView extends HookConsumerWidget {
  const SheaAppHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labelStyle = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(
              labelStyle: labelStyle,
              unselectedLabelStyle: labelStyle,
              indicatorColor: Colors.white,
              tabs: const [
                Tab(icon: Text("Checklist")),
                Tab(icon: Text("Campus Health")),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [SheaDailyChecklist(), SheaCampusHealth()],
            ),
          )
        ],
      ),
    );
  }
}
