import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: _navbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(height: 30),

              _eventCard(
                context,
                title: "Track Day 2025",
                img: "assets/images/trackday.png",
                date: "16 January 2026",
              ),
              const SizedBox(height: 24),

              _eventCard(
                context,
                title: "Go-Kart Championship",
                img: "assets/images/go-kart.png",
                date: "15 February 2026",
              ),
              const SizedBox(height: 24),

              _eventCard(
                context,
                title: "Formula Drift",
                img: "assets/images/formuladrift.png",
                date: "20 February 2026",
              ),
              const SizedBox(height: 24),

              _eventCard(
                context,
                title: "Drift Challenge",
                img: "assets/images/driftchallenge.png",
                date: "26 February 2026",
              ),
              const SizedBox(height: 24),

              _eventCard(
                context,
                title: "Drag Race",
                img: "assets/images/dragrace.png",
                date: "3 March 2026",
              ),
              const SizedBox(height: 24),

              _eventCard(
                context,
                title: "Vintage Car Shows",
                img: "assets/images/vintagecarshows.png",
                date: "8 March 2026",
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _navbar() {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.3),
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
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black.withOpacity(0.12)),
        ),
      ),
    );
  }

  // ---------------- TITLE ----------------
  Widget _title() {
    return Center(
      child: Text(
        "E V E N T S",
        style: GoogleFonts.raleway(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 6,
        ),
      ),
    );
  }

  // ---------------- EVENT CARD ----------------
  Widget _eventCard(
    BuildContext context, {
    required String title,
    required String img,
    required String date,
  }) {
    double width = MediaQuery.of(context).size.width - 32;

    return Container(
      width: width,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 12,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.45),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.raleway(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              date,
              style: GoogleFonts.raleway(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
