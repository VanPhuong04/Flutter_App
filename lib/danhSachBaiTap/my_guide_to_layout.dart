import 'package:flutter/material.dart';

class MyGuideToLayout extends StatelessWidget {
  const MyGuideToLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Guide to Layout', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(child: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(8), child: myBody()),
    )));
  }
}

Widget myBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      block1(),
      SizedBox(height: 20),
      block2(),
      SizedBox(height: 20),
      block3(),
      SizedBox(height: 60),
      block4(),
      block5()
    ],
  );
}

Widget block1(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
      IconButton(icon: Icon(Icons.extension), onPressed: () {})
    ],
  );
}

Widget block2(){
  var mainTitle = "Welcome, \n";
  var subTitle = "Charlie";
  return RichText(text: TextSpan(
    text: mainTitle,
    style: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
    children: [
      TextSpan(
        text: subTitle,
        style: TextStyle(
          fontWeight: FontWeight.normal
        )
      )
    ]
  ));
}

Widget block3(){
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.search, color: Colors.blue),
      hintText: 'Search...'
    ),
  );
}

Widget block4(){
  var mainTitle = "Saved Places";
  return Row(
    children: [
      Text(
        mainTitle,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget block5() {
  var itemCount = 6;
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 2 cột
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12), // CSS bo góc
        child: Image.asset(
          'assets/images/thien_nhien.jpg',
          fit: BoxFit.cover,
        ),
      );
    },
  );
}
