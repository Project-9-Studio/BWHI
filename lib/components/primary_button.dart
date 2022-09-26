import 'package:flutter/material.dart';

class SheaPrimaryButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;

  const SheaPrimaryButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color = Colors.black,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(
          text ?? "",
          style: TextStyle(fontSize: 22, color: textColor),
        ),
      ),
    );
  }
}
