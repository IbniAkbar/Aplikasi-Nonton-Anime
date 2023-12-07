import 'package:flutter/material.dart';

class category extends StatelessWidget {
  final String imagePath;
  final String title;
  final dynamic detail;

  const category({Key? key, required this.imagePath, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman baru
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detail), 
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 70,
            width: 40,
            child: Column(
              children: [
                Image.asset(imagePath),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


