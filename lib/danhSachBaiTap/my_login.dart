import 'package:flutter/material.dart';
import 'package:flutter_nhom4/danhSachBaiTap/dummy_api.dart';
// import 'package:flutter_nhom4/user.dart';
import 'package:flutter_nhom4/danhSachBaiTap/my_profile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Form Đăng Nhập', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(16.0), child: MyBody()),
      ),
    );
  }

  Widget MyBody() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person), // Icon nằm trong ô
              labelText: 'Tên người dùng',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            onChanged: (value) => username = value, // lấy username
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập tên người dùng';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock), // Icon nằm trong ô
              labelText: 'Mật khẩu',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
              suffixIcon: IconButton(
                icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _isHidden = !_isHidden),
              ),
            ),
            onChanged: (value) => password = value, // lấy password
            obscureText: _isHidden,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value.length < 6) {
                return 'Mật khẩu phải có ít nhất 6 ký tự';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.blue, // màu nền
                foregroundColor: Colors.white, // màu chữ và icon
              ),
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;

                // Login → nhận token
                final token = await api.login(username, password);

                if (token != null) {
                  // Chuyển sang trang Profile kèm token
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MyProfile(token: token)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sai thông tin đăng nhập")),
                  );
                }
              },

              icon: const Icon(Icons.login), // icon bên trái chữ
              label: const Text("Đăng nhập"),
            ),
          ),
        ],
      ),
    );
  }
}
