import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rivr_project/rivrBudgetFlow/view/dashboard/home_screen.dart';
import 'package:rivr_project/rivrBudgetFlow/view/rivr_login_screen.dart';
import 'dart:async';
import 'package:rivr_project/rivrBudgetFlow/view/rivr_pre_login.dart';

class RivrSplashScreen extends StatefulWidget {
  const RivrSplashScreen({super.key});

  @override
  State<RivrSplashScreen> createState() => _RivrSplashScreenState();
}

class _RivrSplashScreenState extends State<RivrSplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RivrPreLoginScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/images/rivrSplash.png', fit: BoxFit.cover),
          // Centered column for logo, spinner, and dollar image
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/rivrSplashLogo.png',
                  width: 180, // Adjust as needed
                ),
                const SizedBox(height: 4),
                SpinKitCircle(color: Colors.white, size: 60.0),
              ],
            ),
          ),
          // Animated dollar image from bottom, full width, 35% of screen height
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final screenHeight = MediaQuery.of(context).size.height;
                return SlideTransition(
                  position: _offsetAnimation,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: screenHeight * 0.35,
                    child: Image.asset('assets/images/dollarImage.png', fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
