import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Center(
              child: Text(
                "Hello World",
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
          Icon(Icons.heart_broken, color: Colors.pink, size: 48),
          Text("Goodbye World", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
