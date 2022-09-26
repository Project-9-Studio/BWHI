import 'package:flutter/material.dart';
import 'package:shea/models/fastfacts.dart';

class SheaFastFactCard extends StatelessWidget {
  final SheaFastFact? fact;
  const SheaFastFactCard({super.key, this.fact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 261,
      height: 493,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (fact?.imageUrl != null)
            Container(
              width: double.infinity,
              height: 211,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(fact!.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(fact?.title ?? ""),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              fact?.description ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
