import 'package:flutter/material.dart';
import 'package:flutter_nhom4/danhSachBaiTap/dummy_api.dart';
import 'package:flutter_nhom4/danhSachBaiTap/my_login.dart';
import 'package:flutter_nhom4/danhSachBaiTap/user.dart';

class MyProfile extends StatefulWidget {
  final String token;

  const MyProfile({super.key, required this.token});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late Future<User?> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = api.getUserProfile(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<User?>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("Không thể tải thông tin người dùng"));
          }

          final user = snapshot.data!;

          return MyBody(user);
        },
      ),
    );
  }

  Widget MyBody(User user) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.image),
              ),

              SizedBox(height: 20),

              // Name
              Text(
                "${user.firstName} ${user.lastName}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),
              Text(
                user.email,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),

              SizedBox(height: 20),
              Divider(),

              // Info rows
              Divider(),

              infoRow("Age", "${user.age}"),
              infoRow("Gender", user.gender),
              infoRow("Birth Date", user.birthDate),
              infoRow("Blood Group", user.bloodGroup),
              infoRow("Eye Color", user.eyeColor),

              Divider(),

              infoRow("Phone", user.phone),
              infoRow("Address", user.address),
              infoRow("City", user.city),

              Divider(),

              infoRow("Company", user.company),
              infoRow("Job Title", user.jobTitle),

              SizedBox(height: 20),
              Divider(),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => MyLogin()),
                    (route) => route.isFirst, // giữ lại Home
                  );
                },
                child: Text("Đăng xuất"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget hiển thị 1 dòng thông tin
  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(flex: 3, child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
