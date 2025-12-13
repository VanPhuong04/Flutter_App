import 'package:dio/dio.dart';
import 'package:flutter_nhom4/danhSachBaiTap/product.dart';

class API{
  Future<List<Product>> getAllProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    var response = await dio.request(url);
    List<Product> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((json)=>Product.fromJson(json)).toList();
    } else {
      print('Loi roi');
    }
    return ls;
  }
}

var test_api = API();