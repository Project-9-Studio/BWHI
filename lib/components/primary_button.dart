import 'package:flutter/material.dart';

class SheaPrimaryButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final void Function()? onPressed;

  const SheaPrimaryButton({
    Key? key,
    this.text,
    this.color = Colors.black,
    this.onPressed,
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
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
