import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/background_video.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignup = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPassController = TextEditingController();

  // Button animation state
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _navbar(),
      body: Stack(
        children: [
          _background(),
          _dimLayer(),
          _centerCard(),
        ],
      ),
    );
  }

  // ---------------- NAVBAR ----------------
  PreferredSizeWidget _navbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
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
          child: Container(color: Colors.black.withValues(alpha: 0.15)),
        ),
      ),
    );
  }

  Widget _background() {
    return const Positioned.fill(
      child: BackgroundVideo(
        videoPath: "templates/login.mp4",
      ),
    );
  }

  Widget _dimLayer() {
    return Positioned.fill(
      child: Container(color: Colors.black.withValues(alpha: 0.35)),
    );
  }

  Widget _centerCard() {
    return Center(
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 40 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 380),
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, anim) {
                      return FadeTransition(
                        opacity: anim,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.05),
                            end: Offset.zero,
                          ).animate(anim),
                          child: child,
                        ),
                      );
                    },
                    child: isSignup ? _signupUI() : _loginUI(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- LOGIN UI ----------------
  Widget _loginUI() {
    return Column(
      key: const ValueKey("login"),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Log In",
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 28),

        _field("Email", emailController),
        const SizedBox(height: 16),

        _field("Password", passController, isPassword: true),
        const SizedBox(height: 12),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.poppins(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 32),
        _submitButton("Login"),

        const SizedBox(height: 24),
        _switchText(),
      ],
    );
  }

  // ---------------- SIGNUP UI ----------------
  Widget _signupUI() {
    return Column(
      key: const ValueKey("signup"),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Sign Up",
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),

        const SizedBox(height: 28),
        _field("Username", usernameController),
        const SizedBox(height: 16),

        _field("Email", emailController),
        const SizedBox(height: 16),

        _field("Password", passController, isPassword: true),
        const SizedBox(height: 16),

        _field("Confirm Password", confirmPassController, isPassword: true),

        const SizedBox(height: 32),
        _submitButton("Create Account"),

        const SizedBox(height: 24),
        _switchText(),
      ],
    );
  }

  Widget _field(String hint, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.white.withValues(alpha: 0.5), fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // ---------------- SUBMIT BUTTON ----------------
  Widget _submitButton(String text) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isButtonPressed = true),
      onTapUp: (_) {
        setState(() => _isButtonPressed = false);
        Navigator.pushNamed(context, "/home");
      },
      onTapCancel: () => setState(() => _isButtonPressed = false),
      child: AnimatedScale(
        scale: _isButtonPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.15),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchText() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSignup = !isSignup;
          });
        },
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(color: Colors.white.withValues(alpha: 0.8), fontSize: 13),
            children: [
              TextSpan(text: isSignup ? "Already have an account? " : "Don't have an account? "),
              TextSpan(
                text: isSignup ? "Log in" : "Sign up",
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
