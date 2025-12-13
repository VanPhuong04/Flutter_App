import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Place', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          block1(),
          block2(),
          block3(),
          block4()
        ],
      ),
    );
  }
}

Widget block1(){
  var src = "https://cdnmedia.baotintuc.vn/Upload/JXIafmWVKsccBdbqqMR8Q/files/2023/12/sa%20m%E1%BA%A1c%20Sahara.jpg";
  return Image.network(src, width: 400,
  height: 400,
  fit: BoxFit.cover,);
}
Widget block2(){
  var title = "Oeschinen Lake Campground";
  var subTitle = "Kandersteg, Switzerland";
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(subTitle, style: TextStyle(fontSize: 16, color: Colors.grey))
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
  );
}

Widget block3(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.call, color: Colors.blue),
          Text("CALL", style: TextStyle(color: Colors.blue)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.near_me, color: Colors.blue),
          Text("ROUTE", style: TextStyle(color: Colors.blue)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.share, color: Colors.blue),
          Text("SHARE", style: TextStyle(color: Colors.blue)),
        ],
      ),
    ],
  );
}

Widget block4(){
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Text("Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. "
        "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. "
        "A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, "
        "which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        textAlign: TextAlign.justify,),
  );
}