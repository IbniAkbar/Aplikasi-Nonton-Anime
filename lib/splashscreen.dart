import 'dart:async';
import 'package:flutter/material.dart';
import 'package:praktikum2/Login.dart';

 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), // Ganti dengan durasi splash screen sesuai keinginan Anda
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splashscreen.png', // Ganti dengan nama gambar logo Anda
              width: 150.0, // Sesuaikan dengan ukuran yang diinginkan
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'InAnime App',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

