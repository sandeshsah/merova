import 'package:auth/src/core/themes/app_colors.dart';
import 'package:auth/src/core/widget/button_nav_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home')),
    const Center(child: Text('OTP Page')),
    const Center(child: Text('Scanner Page')),
    const Center(child: Text('Government Page')),
    const Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ButtonNavBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onScannerTap: () {
          // Optional: set currentIndex to 2 or open scanner page
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
    );
  }
}
