import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/school.dart';
import 'package:shea/screens/fast_facts/main.dart';
import 'package:shea/screens/home/app_bar.dart';
import 'package:shea/screens/home/bottom_nav.dart';
import 'package:shea/screens/home/home.dart';
import 'package:shea/screens/resources/main.dart';
import 'package:shea/screens/settings/main.dart';

class SheaAppHome extends HookConsumerWidget {
  const SheaAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const views = [SheaAppHomeView(), SheaFastFactsView(), SheaResourcesView()];
    const titles = [null, "Fast Facts", "Resources", ""];
    final paddingTop = MediaQuery.of(context).padding.top;
    final currentIndex = useState(0);
    final fetchSchools = ref.read(schoolsProvider.notifier).fetchSchools;

    useEffect(() {
      fetchSchools();
      return;
    }, []);

    void onTap(index) {
      if (index == 3) {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SheaSettingsScreen(paddingTop: paddingTop);
          },
        );
        return;
      }
      currentIndex.value = index;
    }

    return Scaffold(
      appBar: SheaHomeAppBar(
        title: titles[currentIndex.value],
      ),
      bottomNavigationBar: SheaHomeBottomNav(
        currentIndex: currentIndex.value,
        onTap: onTap,
      ),
      backgroundColor: const Color(0xFF50B8C2),
      body: views[currentIndex.value],
    );
  }
}
