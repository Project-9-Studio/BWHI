import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SheaSettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const SheaSettingsAppBar({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        title ?? "",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: IconButton(
        icon: const HeroIcon(HeroIcons.arrowLeft),
        onPressed: () => Navigator.pop(context),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
