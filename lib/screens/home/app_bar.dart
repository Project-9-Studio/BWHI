import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

class SheaHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const SheaHomeAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black,
      leading: null,
      title: (title != null)
          ? Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            )
          : Image.asset(
              'assets/images/logo.png',
              width: 24,
            ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'user/notifications');
          },
          icon: const HeroIcon(HeroIcons.bell),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
