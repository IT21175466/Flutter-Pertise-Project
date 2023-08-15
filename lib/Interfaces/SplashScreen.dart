import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height; //- AppBar().preferredSize.height;
    return Scaffold(
      body: Container(
        height: screenHeight - AppBar().preferredSize.height,
        width: screenWidth,
        child: Center(
          child: Image.asset('lib/Assets/Logo.jpeg'),
        ),
      ),
    );
  }
}
