import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Classroom', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: myBody(),
        ),
      ),
    );
  }
}

Widget myBody() {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(
      5,
      (index) => item(),
    ), //Hàm sinh ra 1 danh sách các widget
  );
}

Widget item() {
  var title = "XML và ứng dụng - Nhóm 1";
  var subTitle = "2025-2026.1.TIN4583.001";
  var quantity = "58 học viên";
  return Container(
    height: 200,
    margin: EdgeInsets.only(
      top: 0,
      right: 10,
      bottom: 10,
      left: 10,
    ), //trên 0 , phải dưới trái 10
    padding: EdgeInsets.all(10), //padding bên trong
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey), //Viền
      // color: Colors.amberAccent, //Màu nền
      borderRadius: BorderRadius.circular(10), //Bo góc
      image: DecorationImage(
        image: NetworkImage(
          'https://st.quantrimang.com/photos/image/2018/01/10/hinh-nen-4k-4.jpg',
        ),
        fit: BoxFit.cover, // ảnh phủ kín vùng chứa
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subTitle, style: TextStyle(color: Colors.white)),
              ],
            ),
            Text(quantity, style: TextStyle(color: Colors.white)),
          ],
        ),
        IconButton(
          onPressed: () {
            print("Hello");
          },
          icon: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ],
    ),
  );
}
