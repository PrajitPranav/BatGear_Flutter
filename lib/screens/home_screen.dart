import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';
import '../home/widgets/home_hero_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final ValueNotifier<bool> _showTitle = ValueNotifier(false);
  double _heroHeight = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _heroHeight = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _showTitle.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      // The title appears strictly after the hero video has fully cleared the top edge.
      bool shouldShow = _scrollController.offset >= _heroHeight;
      if (_showTitle.value != shouldShow) {
        _showTitle.value = shouldShow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: _navbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Full Screen Hero Video (100% device height, edge to edge matching Garage)
            const HomeHeroVideo(),
            const SizedBox(height: 20),
            // 2. Stories Section
            _storiesSection(context),
            const SizedBox(height: 20),
            // 3. Discover Section
            _discoverSection(context),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  // ---------------- NAVBAR ----------------
  PreferredSizeWidget _navbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: _buildAnimatedTitle(),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black.withValues(alpha: 0.12)),
        ),
      ),
    );
  }

  Widget _buildAnimatedTitle() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showTitle,
      builder: (context, show, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutCubic,
          opacity: show ? 1.0 : 0.0,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            offset: show ? Offset.zero : const Offset(0, 0.15), // Subtle slide up
            child: child,
          ),
        );
      },
      child: Text(
        "B A T   G E A R",
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w100,
          fontSize: 22,
          letterSpacing: 6,
          color: Colors.white,
        ),
      ),
    );
  }

  // ---------------- STORIES SECTION ----------------
  Widget _storiesSection(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width - 36;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader("STORIES", "Read all stories"),
          const SizedBox(height: 20),

          _storyCard(
            title: "Track Day",
            img: "assets/images/trackday.png",
            date: "26 April 2025",
            width: fullWidth,
          ),
          const SizedBox(height: 24),

          _storyCard(
            title: "Go-Kart Training",
            img: "assets/images/go-kart.png",
            date: "15 Feb 2025",
            width: fullWidth,
          ),
          const SizedBox(height: 24),

          _storyCard(
            title: "Championships",
            img: "assets/images/winners.png",
            date: "02 Jan 2025",
            width: fullWidth,
          ),
        ],
      ),
    );
  }

  Widget _storyCard({
    required String title,
    required String img,
    required String date,
    required double width,
  }) {
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
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withValues(alpha: 0.45),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              date,
              style: const TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- DISCOVER SECTION ----------------
  Widget _discoverSection(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width - 36;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader("DISCOVER", ""),
          const SizedBox(height: 20),

          _discoverCard(
            title: "Bat Meets",
            img: "assets/images/TRACKBW.png",
            desc: "Explore upcoming track days, car meets, and events.",
            width: fullWidth,
          ),
          const SizedBox(height: 24),

          _discoverCard(
            title: "Bat Club Spotlight",
            img: "assets/images/spotlight.png",
            desc: "Submit your car to be featured in weekly spotlight.",
            width: fullWidth,
          ),
          const SizedBox(height: 24),

          _discoverCard(
            title: "Performance Mods",
            img: "assets/images/Perfomance.png",
            desc: "Discover upgrades, exhaust kits, turbo setups.",
            width: fullWidth,
          ),
        ],
      ),
    );
  }

  Widget _discoverCard({
    required String title,
    required String img,
    required String desc,
    required double width,
  }) {
    return Container(
      width: width,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withValues(alpha: 0.55),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _sectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
