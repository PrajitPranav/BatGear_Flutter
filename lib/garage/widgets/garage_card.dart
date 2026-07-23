import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/garage_car.dart';

class GarageCard extends StatefulWidget {
  final GarageCar car;

  const GarageCard({
    super.key,
    required this.car,
  });

  @override
  State<GarageCard> createState() => _GarageCardState();
}

class _GarageCardState extends State<GarageCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isPressed ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isPressed
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.05),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isPressed ? 0.8 : 0.4),
              blurRadius: _isPressed ? 25 : 15,
              offset: Offset(0, _isPressed ? 12 : 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Container taking top half with overflow clip and scale zoom
              SizedBox(
                height: 220,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: AnimatedScale(
                    scale: _isPressed ? 1.06 : 1.0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    child: Image.asset(
                      widget.car.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[900],
                        child: const Center(
                          child: Icon(
                            Icons.directions_car,
                            color: Colors.white38,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Vehicle Title, Description, and Explore Build Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.car.title,
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.car.description,
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.5),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _ExploreButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreButton extends StatefulWidget {
  const _ExploreButton();

  @override
  State<_ExploreButton> createState() => _ExploreButtonState();
}

class _ExploreButtonState extends State<_ExploreButton> {
  bool _isBtnPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isBtnPressed = true),
      onTapUp: (_) => setState(() => _isBtnPressed = false),
      onTapCancel: () => setState(() => _isBtnPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: _isBtnPressed ? Colors.white : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color:
                _isBtnPressed ? Colors.white : Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            'EXPLORE BUILD',
            style: GoogleFonts.raleway(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: _isBtnPressed ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
