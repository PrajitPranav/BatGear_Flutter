import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/membership_screen.dart';
import 'garage/screens/garage_home_screen.dart';

void main() {
  runApp(const BatGearApp());
}

class BatGearApp extends StatelessWidget {
  const BatGearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // FIRST SCREEN THE USER SEES
      home: const LoginScreen(),

      // ROUTES USED BY NAVIGATION + DRAWER
      routes: {
        "/home": (context) => const HomeScreen(),
        "/dashboard": (context) => const DashboardScreen(),
        "/events": (context) => const EventsScreen(),
        "/contact": (context) => const ContactUsScreen(),
        "/membership": (context) => const SubscriptionScreen(),
        "/garage": (context) => const GarageHomeScreen(),
      },
    );
  }
}
