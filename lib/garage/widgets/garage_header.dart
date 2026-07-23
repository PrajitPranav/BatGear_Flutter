import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GarageHeader extends StatelessWidget {
  const GarageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BAT GEAR GARAGE',
          style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.w100,
            letterSpacing: 6.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
