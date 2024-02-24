import 'package:codealpha_random_quote_generator/Layout/my_home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Container(
      // width: size.width,
      color: Colors.pink.shade200,
      child: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 100,
          width: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}