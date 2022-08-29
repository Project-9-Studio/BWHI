import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shea/components/shea_text_logo.dart';

class SheaHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SheaHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black,
      leading: null,
      title: const SheaLogoText(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
