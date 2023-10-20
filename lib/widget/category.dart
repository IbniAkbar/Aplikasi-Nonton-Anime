import 'package:flutter/material.dart';

class category extends StatelessWidget {
  final String imagePath;
  final String title;
  const category({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 70,
          width: 50,
          child: Column(
            children: [
              Image.asset(imagePath),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 10),
              )
            ],
          ),
        ),
      ), 
    );
  }
}