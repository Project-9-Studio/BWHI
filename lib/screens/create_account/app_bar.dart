import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shea/screens/create_account/back_button.dart';

class SheaCreateAccountAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showBackButton;

  const SheaCreateAccountAppBar({
    Key? key,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: const Color(0xff50B8C2),
      elevation: 0,
      leading: (canPop && showBackButton) ? const SheaBackButton() : null,
      automaticallyImplyLeading: false,
      leadingWidth: 90,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
