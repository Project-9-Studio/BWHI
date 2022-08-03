import 'package:flutter/material.dart';

class SheaBackButton extends StatelessWidget {
  const SheaBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Row(children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        const Text("Back", style: TextStyle(fontSize: 18, color: Colors.black))
      ]),
    );
  }
}
