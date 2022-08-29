import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/components/profile_nav_button.dart';

class SheaHomeBottomNav extends StatelessWidget {
  const SheaHomeBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: HeroIcon(HeroIcons.home),
          ),
          BottomNavigationBarItem(
            label: "Fast Facts",
            icon: HeroIcon(HeroIcons.documentDuplicate),
          ),
          BottomNavigationBarItem(
            label: "Resources",
            icon: HeroIcon(HeroIcons.bookOpen),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SheaProfileNavButton(),
          ),
        ],
      ),
    );
  }
}
