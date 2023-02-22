import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Dashboard Screen/dashboard_screen.dart';
import '../Profile Screen/profile_screen.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        color: Colors.deepPurple.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
              iconSize: 26,
              selectedIndex: 2,
              curve: Curves.slowMiddle,
              backgroundColor: Colors.deepPurple.shade100,
              color: Colors.deepPurple.shade500,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.deepPurple.shade300.withOpacity(0.8),
              gap: 8,
              padding: const EdgeInsets.all(12),
              tabs: [
                GButton(icon: Icons.home, text: 'Home',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
                const GButton(icon: Icons.qr_code_scanner_sharp, text: 'QR',),
                GButton(icon: Icons.history, text: 'History',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const PurchaseHistoryScreen()),
                    );
                  },
                ),
                GButton(icon: Icons.person, text: 'Profile',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
              ]
          ),
        ),
      ),
    );
  }
}
