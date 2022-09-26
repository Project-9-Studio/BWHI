import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SheaSettingsNavItem extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final void Function()? onTap;

  const SheaSettingsNavItem({
    super.key,
    this.label,
    this.labelColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(children: [
          Expanded(
            child: Text(
              label ?? "",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: labelColor ?? Colors.black,
              ),
            ),
          ),
          const HeroIcon(
            HeroIcons.arrowRight,
            color: Colors.black,
          )
        ]),
      ),
    );
  }
}
