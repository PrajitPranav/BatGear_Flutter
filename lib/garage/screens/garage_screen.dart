import 'package:flutter/material.dart';
import '../widgets/hero_video.dart';
import '../widgets/garage_intro.dart';
import '../widgets/garage_car_section.dart';
import '../../widgets/app_drawer.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final GlobalKey _carsSectionKey = GlobalKey();

  void _scrollToCars() {
    final context = _carsSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. Full Screen BMW Hero Video Section
            const HeroVideo(),

            // 2. Information Section (Officine BatWorks + Book For A Cruise)
            GarageIntro(
              onBookPressed: _scrollToCars,
            ),

            // 3. Showcase Garage Cars Section
            GarageCarSection(
              key: _carsSectionKey,
            ),
          ],
        ),
      ),
    );
  }
}
