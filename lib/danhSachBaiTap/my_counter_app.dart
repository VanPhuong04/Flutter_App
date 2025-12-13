import 'package:flutter/material.dart';

class MyCounterApp extends StatefulWidget {
  MyCounterApp({super.key});
  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  var countNumber = 0;
  Color numberColor = Colors.grey;
  List<Color> listColor = [Colors.red, Colors.green, Colors.grey];

  void _incrementCounter() {
    setState(() {
      countNumber++;
      numberColor = listColor[1];
    });
  }

  void _decrementCounter() {
    setState(() {
      countNumber--;
      numberColor = listColor[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ứng dụng đếm số'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(child: myBody()),
    );
  }

  Widget myBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Giá trị hiện tại:'),
          SizedBox(height: 10),
          Text(
            '$countNumber',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: numberColor,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    _decrementCounter();
                  });
                },
                child: Text('Giảm', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  setState(() {
                    countNumber = 0;
                    numberColor = Colors.grey;
                  });
                },
                child: Text('Đặt lại', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  setState(() {
                    _incrementCounter();
                  });
                },
                child: Text('Tăng', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
