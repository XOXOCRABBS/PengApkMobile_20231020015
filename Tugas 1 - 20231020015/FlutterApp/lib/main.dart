import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Pertama Saya",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aplikasi Pertama Saya"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    "Kanderstag, Switzerland",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.red),
                  Text("41")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
