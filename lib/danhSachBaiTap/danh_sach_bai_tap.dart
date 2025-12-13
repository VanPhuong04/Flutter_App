// import 'package:flutter/material.dart';
import 'package:flutter_nhom4/model/bai_tap.dart';
import '../danhSachBaiTap/my_login.dart';
import '../danhSachBaiTap/my_home_page.dart';
import '../danhSachBaiTap/my_place.dart';
import '../danhSachBaiTap/my_classroom.dart';
import '../danhSachBaiTap/my_guide_to_layout.dart';
import '../danhSachBaiTap/my_color_change_app.dart';
import '../danhSachBaiTap/my_counter_app.dart';
import '../danhSachBaiTap/My_Countdown_Timer.dart';
import '../danhSachBaiTap/my_register.dart';
import '../danhSachBaiTap/my_bmi_form.dart';
import '../danhSachBaiTap/my_response_form.dart';
import '../danhSachBaiTap/my_product.dart';






final List<ExerciseItem> exercises = [
  ExerciseItem(title: 'Bài tập 1: Hello World', screen: MyHomePage()),
  ExerciseItem(title: 'Bài tập 2: Trang địa điểm', screen: MyPlace()),
  ExerciseItem(title: 'Bài tập 3: Trang lớp học', screen: MyClassroom()),
  ExerciseItem(title: 'Bài tập 4: Hướng dẫn bố cục và gridView ảnh', screen: MyGuideToLayout()),
  ExerciseItem(title: 'Bài tập 5: Ứng dụng đổi màu nền', screen: MyColorChangeApp()),
  ExerciseItem(title: 'Bài tập 6: Ứng dụng đếm số', screen: MyCounterApp()),
  ExerciseItem(title: 'Bài tập 7: Bộ đếm thời gian', screen: MyCountdownTimer()),
  ExerciseItem(title: 'Bài tập 8: Trang đăng nhập', screen: MyLogin()),
  ExerciseItem(title: 'Bài tập 9: Trang đăng ký', screen: MyRegister()),
  ExerciseItem(title: 'Bài tập 10: Ứng dụng tính chỉ số BMI', screen: MyBmiForm()),
  ExerciseItem(title: 'Bài tập 11: Biểu mẫu phản hồi', screen: MyResponseForm()),
  ExerciseItem(title: 'Bài tập 12: API sản phẩm', screen: MyProduct()),
];
