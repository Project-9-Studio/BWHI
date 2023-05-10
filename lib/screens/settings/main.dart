import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/components/school_picker.dart';
import 'package:shea/screens/settings/nav_item.dart';

class SheaSettingsScreen extends StatelessWidget {
  final double? paddingTop;

  const SheaSettingsScreen({super.key, this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: paddingTop ?? 0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            icon: const HeroIcon(HeroIcons.arrowLeft),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SheaSettingsNavItem(
                label: "Profile",
                onTap: () => Navigator.pushNamed(context, 'profile'),
              ),
              SheaSettingsNavItem(
                label: "Notifications",
                onTap: () => Navigator.pushNamed(context, 'notifications'),
              ),
              const SheaSelectSchoolPicker(
                widget: SheaSettingsNavItem(
                  label: "Change School",
                  labelColor: Color(0xFF0F4C82),
                ),
              ),
              SheaSettingsNavItem(
                label: "Log out",
                labelColor: const Color(0xFFFE5C5C),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "onboard",
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
