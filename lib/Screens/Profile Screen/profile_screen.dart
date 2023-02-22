import 'package:besan_1/Screens/Auth%20Screen/login_or_register_screen.dart';
import 'package:besan_1/Screens/Profile%20Screen/update_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Dashboard Screen/dashboard_screen.dart';
import '../History Screen/history_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: signUserOut,
                icon: const Icon(Icons.logout, color: Colors.black)
            ),
          ],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: Colors.deepPurple.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
                iconSize: 26,
                selectedIndex: 3,
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
                        context, MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                      );
                    },
                  ),
                  const GButton(icon: Icons.qr_code_scanner_sharp, text: 'QR',),
                  GButton(icon: Icons.history, text: 'History',
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const PurchaseHistoryScreen()),
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(
                      'Your Profile',
                      style: GoogleFonts.sansita(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: AssetImage('assets/images/besan.jpg'),
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                            'Besan Alaa Zakaria',
                            style: GoogleFonts.sansita(fontSize: 30)
                        ),
                        const SizedBox(height: 20),
                        Text(
                            'besanalaa433@gmail.com',
                            style: GoogleFonts.abel(fontSize: 18,
                                color: Colors.grey[600])),
                        const SizedBox(height: 40),
                        Divider(thickness: 0.4, color: Colors.grey[400]),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 170,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.push(
                                  context, MaterialPageRoute(builder: (
                                    context) => const UpdateProfileScreen()),
                                ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade300
                                  .withOpacity(0.8),
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                                'Edit Profile', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

