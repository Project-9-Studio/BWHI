import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SheaOnboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SheaOnboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: const Color(0xff50B8C2),
      elevation: 0,
      leading: Column(),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'signIn');
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
