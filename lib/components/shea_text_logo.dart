import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SheaLogoText extends StatelessWidget {
  const SheaLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        "Shea",
        style: GoogleFonts.dancingScript(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF1B3DC),
        ),
      ),
    );
  }
}
