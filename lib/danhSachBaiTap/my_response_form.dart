import 'package:flutter/material.dart';

class MyResponseForm extends StatefulWidget {
  const MyResponseForm({super.key});

  @override
  State<MyResponseForm> createState() => _MyResponseFormState();
}

class _MyResponseFormState extends State<MyResponseForm> {
  String? selectedValue = '1 sao';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gửi phản hồi', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.orange,
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
              labelText: 'Họ tên',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập họ tên';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          DropdownButtonFormField<String>(
            initialValue: selectedValue,
            decoration: InputDecoration(
              labelText: 'Đánh giá (1 - 5 sao)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            items: [
              DropdownMenuItem(value: '1 sao', child: Text('1 sao')),
              DropdownMenuItem(value: '2 sao', child: Text('2 sao')),
              DropdownMenuItem(value: '3 sao', child: Text('3 sao')),
              DropdownMenuItem(value: '4 sao', child: Text('4 sao')),
              DropdownMenuItem(value: '5 sao', child: Text('5 sao')),
            ],
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.feedback_outlined), // Icon nằm trong ô
              labelText: 'Nội dung góp ý',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Gửi phản hồi thành công')));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Màu nền
              foregroundColor: Colors.white, // Màu chữ
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 15,
              ), // Khoảng cách bên trong
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bo góc
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Giữ nút không quá rộng
              children: [
                Icon(Icons.send),
                SizedBox(width: 8), // Khoảng cách giữa icon và text
                Text('Gửi phản hồi'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
