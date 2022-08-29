import 'package:flutter/material.dart';

class SheaProfileNavButton extends StatelessWidget {
  const SheaProfileNavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Center(child: Text("C", style: TextStyle(fontSize: 12))),
      ),
    );
  }
}
