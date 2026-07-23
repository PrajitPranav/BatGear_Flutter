import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_drawer.dart';
import '../screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedTab = 0;

  final List<String> tabs = [
    "Personal Details",
    "Secondary User",
    "Login & Security",
    "Payment Method",
  ];

  
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: _navbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(height: 30),
              _tabBar(),
              const SizedBox(height: 25),
              _tabContent(),
              const SizedBox(height: 80),
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

  Widget _title() {
    return Center(
      child: Text(
        "D A S H B O A R D",
        style: GoogleFonts.raleway(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 6,
        ),
      ),
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          bool active = index == selectedTab;
          return GestureDetector(
            onTap: () => setState(() => selectedTab = index),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tabs[index],
                    style: GoogleFonts.raleway(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: active ? Colors.black : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  active
                      ? Container(
                          height: 2,
                          width: 60,
                          color: Colors.black,
                        )
                      : const SizedBox(height: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _tabContent() {
    switch (selectedTab) {
      case 0:
        return _personalDetails();
      case 1:
        return _secondaryUser();
      case 2:
        return _loginSecurity();
      case 3:
        return _paymentMethod();
      default:
        return _personalDetails();
    }
  }

  Widget _formField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ---------------- PERSONAL DETAILS SECTION ----------------
  Widget _personalDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Win the data race.",
              style: GoogleFonts.raleway(
                  fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(
            "You're almost done. Complete your data so we can provide you with the best support.",
            style: GoogleFonts.raleway(fontSize: 14),
          ),
          const SizedBox(height: 20),

          // PROGRESS BAR
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text("40%",
                  style: GoogleFonts.raleway(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),

          const SizedBox(height: 25),

          // FORM FIELDS
          _formField("Full Name", nameController),
          _formField("Email Address", emailController),
          _formField("Phone Number", phoneController),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text("Save Details",
                  style: GoogleFonts.raleway(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- SECONDARY USER SECTION ----------------
  Widget _secondaryUser() {
    return Column(
      children: [
        Image.asset("assets/images/TRACKWITHP.png"),
        const SizedBox(height: 12),
        Text(
          "As a Bat Gear member, you can authorise others as secondary users.\nThey get their own Bat Gear ID and access privileges.",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(fontSize: 15),
        ),
      ],
    );
  }

  // ---------------- LOGIN & SECURITY SECTION ----------------
  Widget _loginSecurity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Manage your password, two-factor authentication\nand login activity.",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(fontSize: 15),
        ),

        const SizedBox(height: 30),

        // LOGOUT BUTTON
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            child: Text("Logout",
                style: GoogleFonts.raleway(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  // ---------------- PAYMENT METHOD SECTION ----------------
  Widget _paymentMethod() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () => _openPaymentOptions(),
        child: Text("Add new payment method",
            style: GoogleFonts.raleway(fontSize: 15)),
      ),
    );
  }

  // ---------------- PAYMENT OPTIONS BOTTOM SHEET ----------------
  void _openPaymentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height: 260,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text("Choose Payment Method",
                  style: GoogleFonts.raleway(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              _paymentOption("Credit / Debit Card"),
              _paymentOption("UPI ID"),
              _paymentOption("UPI Apps (GPay / PhonePe / Paytm)"),
            ],
          ),
        );
      },
    );
  }

  Widget _paymentOption(String title) {
    return ListTile(
      title: Text(title,
          style: GoogleFonts.raleway(
              fontSize: 15, fontWeight: FontWeight.w500)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
