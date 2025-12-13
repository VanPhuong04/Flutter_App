import 'dart:async';

import 'package:flutter/material.dart';

class MyCountdownTimer extends StatefulWidget {
  MyCountdownTimer({super.key});

  @override
  State<MyCountdownTimer> createState() => _MyCountdownTimerState();
}

class _MyCountdownTimerState extends State<MyCountdownTimer> {
  var myTime = 0;
  Timer? _timer;
  void _startTimer() {
    // Nếu đang có timer, hủy trước
    _timer?.cancel();

    // Tạo timer chạy mỗi 1 giây
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (myTime > 0) {
        setState(() {
          myTime--; // Giảm 1 giây mỗi lần
        });
      } else {
        timer.cancel(); // Hết thời gian → dừng timer
      }
    });
  }

  String _formatTime(int myTime) {
    int seconds = myTime % 60;
    int minutes = (myTime ~/ 60) % 60;
    int hours = myTime ~/ 3600;

    // Trả về chuỗi dạng HH:MM:SS
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bộ đếm thời gian'),
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
          Text('Nhập số giây đếm ngược:', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ), // padding 2 bên
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // bo góc
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ), // padding bên trong TextField
                hintText: 'Nhập số giây',
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    myTime = 0; // reset về 0 khi xóa hết
                  });
                } else {
                  int? seconds = int.tryParse(value);
                  if (seconds != null) {
                    setState(() {
                      myTime = seconds;
                    });
                  }
                }
              },
            ),
          ),

          Text(
            _formatTime(myTime),
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Bắt đầu bộ đếm thời gian
                  setState(() {
                    _startTimer();
                  });
                },
                child: Text('Bắt đầu'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Đặt lại bộ đếm thời gian
                  setState(() {
                    myTime = 0;
                    _timer?.cancel();
                  });
                },
                child: Text('Đặt lại'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
