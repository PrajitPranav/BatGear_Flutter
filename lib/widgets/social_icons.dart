import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Coming Soon",
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(context, Icons.camera_alt_outlined), // Instagram roughly
        _buildIcon(context, Icons.facebook_outlined),
        _buildIcon(context, Icons.close), // X (Twitter)
        _buildIcon(context, Icons.work_outline), // LinkedIn
        _buildIcon(context, Icons.code), // Github
      ],
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => _showComingSoon(context),
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
