import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/screens/home/app_bar.dart';
import 'package:shea/screens/home/bottom_nav.dart';
import 'package:shea/screens/home/campus_health.dart';
import 'package:shea/screens/home/checklist.dart';

class SheaAppHome extends HookConsumerWidget {
  const SheaAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labelStyle = GoogleFonts.urbanist(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      appBar: const SheaHomeAppBar(),
      bottomNavigationBar: const SheaHomeBottomNav(),
      backgroundColor: const Color(0xFF50B8C2),
      body: DefaultTabController(
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
      ),
    );
  }
}
