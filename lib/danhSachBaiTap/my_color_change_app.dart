import 'dart:math';

import 'package:flutter/material.dart';

class MyColorChangeApp extends StatefulWidget {
  MyColorChangeApp({super.key});

  @override
  State<MyColorChangeApp> createState() => _MyColorChangeAppState();
}

class _MyColorChangeAppState extends State<MyColorChangeApp> {
  Color bgColor = Colors.purple;
  var bgColorString = "Tím";
  List<Color> listColor = [
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];
  List<String> listColorString = ["Đỏ", "Tím", "Xanh lá", "Vàng", "Cam"];

  void _changColor() {
    var rand = Random();
    var number = rand.nextInt(listColor.length);
    setState(() {
      bgColor = listColor[number];
      bgColorString = listColorString[number];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ứng dụng đổi màu nền'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(child: myBody()),
    );
  }

  Widget myBody() {
    var ColorTitle = "Màu hiện tại";

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ColorTitle,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            bgColorString,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  backgroundColor: Colors.black.withOpacity(0.3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _changColor();
                  });
                },
                child: const Text("Đổi màu nền"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bgColor = Colors.purple;
                    bgColorString = "Tím";
                  });
                },
                child: const Text("Đặt lại"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
