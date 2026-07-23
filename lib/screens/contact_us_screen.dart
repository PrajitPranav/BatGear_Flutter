import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../widgets/contact_card.dart';
import '../widgets/contact_form.dart';
import '../widgets/office_hours_card.dart';
import '../widgets/support_card.dart';
import '../widgets/social_icons.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Monochromatic theme
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeroHeader(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  children: [
                    _buildQuickContactCards(),
                    const SizedBox(height: 40),
                    const ContactForm(),
                    const SizedBox(height: 40),
                    const OfficeHoursCard(),
                    const SizedBox(height: 40),
                    const SupportCard(),
                    const SizedBox(height: 40),
                    const SocialIcons(),
                    const SizedBox(height: 40),
                    _buildFooter(),
                    const SizedBox(height: 40), // Bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Contact Us",
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w300,
          fontSize: 20,
          letterSpacing: 2,
          color: Colors.white,
        ),
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.black.withValues(alpha: 0.15)),
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + kToolbarHeight + 40,
        bottom: 40,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05), // Very subtle background
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get in Touch",
            style: GoogleFonts.poppins(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "We're here to help you with everything related to BatGear.\nReach out anytime and we'll get back to you as soon as possible.",
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white.withValues(alpha: 0.7),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickContactCards() {
    return Column(
      children: const [
        ContactCard(
          icon: Icons.email_outlined,
          title: "support@batgear.com",
          description: "General support and technical assistance.",
        ),
        ContactCard(
          icon: Icons.phone_outlined,
          title: "+91 98765 43210",
          description: "Available Monday – Friday\n9:00 AM – 6:00 PM",
        ),
        ContactCard(
          icon: Icons.location_on_outlined,
          title: "BatGear Headquarters",
          description: "Chennai, Tamil Nadu\nIndia\n\nVisit us during working hours.",
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          "Made with ❤️ by BatGear",
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.4),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Version 1.0.0",
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.3),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
