import 'package:dio/dio.dart';
import 'package:flutter_nhom4/danhSachBaiTap/user.dart';


class API {
  final dio = Dio();

  // LOGIN → trả về AuthResponse
  Future<String?> login(String username, String password) async {
    const url = 'https://dummyjson.com/auth/login';

    try {
      final response = await dio.post(
        url,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return response.data["accessToken"];
      } else {
        print("Lỗi login: status != 200");
        return null;
      }
    } catch (e) {
      print("Lỗi login: $e");
      return null;
    }
  }

  // GET PROFILE → trả về User (full info)
  Future<User?> getUserProfile(String token) async {
    const url = 'https://dummyjson.com/auth/me';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        print("Lỗi profile: status != 200");
        return null;
      }
    } catch (e) {
      print("Lỗi lấy profile: $e");
      return null;
    }
  }
}

// Singleton
final api = API();
