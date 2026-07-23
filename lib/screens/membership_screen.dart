import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final ScrollController _scroll = ScrollController();
  double scrollValue = 0.0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      setState(() {
        scrollValue = _scroll.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;

    // SCROLL-BASED ANIMATION VALUES
    double scale = 1 + (scrollValue / screenH * 4);
    scale = scale.clamp(1, 12);

    double heroOpacity = (1 - scrollValue / (screenH * 0.6)).clamp(0, 1);

    double afterTextOpacity =
        (scrollValue / (screenH * 0.4)).clamp(0, 1);

    return Scaffold(
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: _navbar(),
      body: Stack(
        children: [
          // BLACK BACKGROUND
          Container(color: Colors.black),

          // MAIN SCROLL VIEW
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                // ---------------- HERO SECTION ----------------
                SizedBox(
                  height: screenH,
                  child: Center(
                    child: Opacity(
                      opacity: heroOpacity,
                      child: Transform.scale(
                        scale: scale,
                        child: Text(
                          "WELCOME TO\nBAT GEAR",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 36,
                            letterSpacing: 6,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ---------------- AFTER TEXT SECTION ----------------
                Opacity(
                  opacity: afterTextOpacity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _line("Join Bat Gear — a car club for those who live to drive."),
                        _line("Get exclusive access to performance mods and garage meets."),
                        _line("Unlock cinematic builds, elite tuning secrets, giveaways."),
                        _line("Built for enthusiasts, by enthusiasts."),
                        _line("Memberships open now. Let's roll."),
                        const SizedBox(height: 30),

                        // BUTTON
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              "Buy a Membership",
                              style: GoogleFonts.raleway(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 400),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SINGLE LINE OF TEXT
  Widget _line(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  // NAVBAR
  PreferredSizeWidget _navbar() {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.25),
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        "B A T   G E A R",
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w100,
          fontSize: 22,
          letterSpacing: 6,
          color: Colors.white,
        ),
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.black.withOpacity(0.12)),
        ),
      ),
    );
  }
}
