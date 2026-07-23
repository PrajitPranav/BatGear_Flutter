import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GarageIntro extends StatelessWidget {
  final VoidCallback onBookPressed;

  const GarageIntro({
    super.key,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle
          Text(
            'FROM DARK TO LEGEND',
            style: GoogleFonts.raleway(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 2.0,
              color: Colors.grey[400],
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
          const SizedBox(height: 16),

          // Title
          Text(
            'Officine BatWorks',
            style: GoogleFonts.raleway(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: 0.1, end: 0),
          const SizedBox(height: 24),

          // Description Paragraph
          Text(
            'Experience unmatched customization, from raw chassis to street legend. Design your dream machine at Officine BatWorks – where innovation meets underground spirit. Precision meets passion in a journey from bolt to beast. It\'s time for your obsession to roar.',
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.6,
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.1, end: 0),
          const SizedBox(height: 36),

          // Book For A Cruise Button
          _BookCruiseButton(onPressed: onBookPressed)
              .animate()
              .fadeIn(duration: 600.ms, delay: 300.ms),
        ],
      ),
    );
  }
}

class _BookCruiseButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _BookCruiseButton({required this.onPressed});

  @override
  State<_BookCruiseButton> createState() => _BookCruiseButtonState();
}

class _BookCruiseButtonState extends State<_BookCruiseButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Text(
          'BOOK FOR A CRUISE',
          style: GoogleFonts.raleway(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: _isPressed ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
