import 'package:besan_1/Screens/Profile%20Screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import '../History Screen/history_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
              selectedIndex: 0,
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
                const GButton(icon: Icons.qr_code_scanner_sharp, text: 'QR',),
                GButton(icon: Icons.history, text: 'History',
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const PurchaseHistoryScreen()),
                    );
                  },
                ),
                GButton(icon: Icons.person, text: 'Profile',
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
              ]
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome to The Smart Cart App..',
                      style: GoogleFonts.sansita(
                          fontSize: 30, fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 80),
                    Lottie.asset('assets/images/shopping-cart.json',
                      height: 300
                    ),
                    const SizedBox(height: 100),
                    Text(
                      '"Scan the QR and get your own Cart now!"',
                      style: GoogleFonts.sansita(
                          fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
