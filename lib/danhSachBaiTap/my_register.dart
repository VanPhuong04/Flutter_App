import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool _isHidden = true;
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Đăng ký tài khoản',
          style: TextStyle(color: Colors.white),
        ),
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
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person), // Icon nằm trong ô
              labelText: 'Tên người dùng',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
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
              prefixIcon: Icon(Icons.email), // Icon nằm trong ô
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || !value.contains('@gmail.com')) {
                return 'Vui lòng nhập email';
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
            obscureText: _isHidden,
            onChanged: (value) {
              _password = value;
            },
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
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline_rounded), // Icon nằm trong ô
              labelText: 'Xác nhận mật khẩu',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
              suffixIcon: IconButton(
                icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _isHidden = !_isHidden),
              ),
            ),
            obscureText: _isHidden,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty || value != _password) {
                return 'Vui lòng xác nhận mật khẩu';
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Dang Ky thành công')),
                    );
                  }
                },
                icon: const Icon(Icons.person_add), // icon bên trái chữ
                label: const Text("Register"),
              ),
            )
          // ElevatedButton(
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       ScaffoldMessenger.of(
          //         context,
          //       ).showSnackBar(SnackBar(content: Text('Dữ liệu hợp lệ!')));
          //     }
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue, // Màu nền
          //     foregroundColor: Colors.white, // Màu chữ
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 60,
          //       vertical: 15,
          //     ), // Khoảng cách bên trong
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12), // Bo góc
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min, // Giữ nút không quá rộng
          //     children: [
          //       Icon(Icons.person_add),
          //       SizedBox(width: 8), // Khoảng cách giữa icon và text
          //       Text('Đăng ký'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
