import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'home_overlay_text.dart';

class HomeHeroVideo extends StatefulWidget {
  const HomeHeroVideo({super.key});

  @override
  State<HomeHeroVideo> createState() => _HomeHeroVideoState();
}

class _HomeHeroVideoState extends State<HomeHeroVideo> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset('templates/bmw_home.mp4');
    try {
      await _controller.initialize();
      _controller.setVolume(0.0);
      _controller.setLooping(true);
      await _controller.play();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint("Error initializing Home Hero Video: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        children: [
          // Background Video filling 100% screen height with BoxFit.cover
          Positioned.fill(
            child: _isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: Transform.scale(
                        scale: 1.4,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white24,
                      ),
                    ),
                  ),
          ),

          // Subtle Dark Overlay for contrast
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),

          // Perfectly Centered Overlay Text
          const Positioned.fill(
            child: HomeOverlayText(),
          ),
        ],
      ),
    );
  }
}
