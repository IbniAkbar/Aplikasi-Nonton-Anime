import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum2/Profil.dart';
import 'package:praktikum2/home_page.dart';

final screen = [
  HomePage(),
  const ProfilePage(),

];

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFFE9EEFA)));

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: screen[_currentIndex],
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF231F20),
        items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.person_2),label: "Profile"),
        ],
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }
}