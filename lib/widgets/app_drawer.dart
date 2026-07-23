import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.85),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "B A T   G E A R",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 6,
                  color: Colors.white,
                ),
              ),
            ),

            const Divider(color: Colors.white24),

            _drawerItem(context, "Home", "/home"),
            _drawerItem(context, "Dashboard", "/dashboard"),
            _drawerItem(context, "Events", "/events"),
            _drawerItem(context, "Membership", "/membership"),
            _drawerItem(context, "Garage", "/garage"),
            _drawerItem(context, "Contact Us", "/contact"),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 2,
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
