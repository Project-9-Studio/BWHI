import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SheaHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SheaHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black,
      leading: null,
      title: Image.asset(
        'assets/images/logo.png',
        width: 24,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
