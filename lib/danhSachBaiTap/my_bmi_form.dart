import 'package:flutter/material.dart';

class MyBmiForm extends StatefulWidget {
  const MyBmiForm({super.key});

  @override
  State<MyBmiForm> createState() => _MyBmiFormState();
}

class _MyBmiFormState extends State<MyBmiForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showResult = false;
  double heightInput = 0.0;
  double weightInput = 0.0;
  double bmiResult = 0.0;
  String bmiCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tính chỉ số BMI', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
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
              prefixIcon: Icon(Icons.height), // Icon nằm trong ô
              labelText: 'Chiều cao (m)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              heightInput = double.tryParse(value) ?? 0.0;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập chiều cao';
              }
              final height = double.tryParse(value);
              if (height == null || height <= 0) {
                return 'Chiều cao không hợp lệ';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.monitor_weight), // Icon nằm trong ô
              labelText: 'Cân nặng (kg)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), //chỉnh bo góc
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              weightInput = double.tryParse(value) ?? 0.0;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập cân nặng';
              }
              final weight = double.tryParse(value);
              if (weight == null || weight <= 0) {
                return 'Cân nặng không hợp lệ';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  bmiResult = weightInput / (heightInput * heightInput);
                  if (bmiResult < 18.5) {
                    bmiCategory = 'Thiếu cân';
                  } else if (bmiResult < 24.9) {
                    bmiCategory = 'Bình thường';
                  } else if (bmiResult < 29.9) {
                    bmiCategory = 'Thừa cân';
                  } else {
                    bmiCategory = 'Béo phì';
                  }

                  _showResult = true;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ), // Khoảng cách bên trong
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Giữ nút không quá rộng
              children: [
                Icon(Icons.calculate),
                SizedBox(width: 8), // Khoảng cách giữa icon và text
                Text('Tính BMI'),
              ],
            ),
          ),
          SizedBox(height: 30),
          if (_showResult)
            Column(
              children: [
                Text(
                  'Chỉ số BMI: ${bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Phân loại: $bmiCategory',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
