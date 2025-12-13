import 'package:flutter/material.dart';
import 'package:flutter_nhom4/danhSachBaiTap/product.dart';

class MyDetailProduct extends StatefulWidget {
  final Product product;

  const MyDetailProduct({super.key, required this.product});

  @override
  State<MyDetailProduct> createState() => _MyDetailProductState();
}

class _MyDetailProductState extends State<MyDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myDetailBody(),
      bottomNavigationBar: myBottomBar(),
    );
  }

  // Tiêu đề
  PreferredSizeWidget myAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60), // chiều cao AppBar
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF53D2D), // #f53d2d
              Color(0xFFFF6633), // #f63
            ],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            height: 40,
            child: Row(
              children: [
                // Thanh tìm kiếm
                Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Tìm sản phẩm, danh mục ...",
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),

                        // 👉 ICON MÁY ẢNH
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // xử lý mở camera hoặc chức năng bạn muốn
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),

                // Phải sử dụng stack để chồng icon số lượng lên icon giỏ hàng
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart_checkout_outlined),
                      onPressed: () {},
                    ),
                    // bỏ số lượng sản phầm thành icon nhỏ chồng lên icon giỏ hàng
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: Text(
                            "3", // số lượng sản phẩm trong giỏ
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Icon chat
                IconButton(icon: Icon(Icons.chat_outlined), onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Nội dung chi tiết sản phẩm
  Widget myDetailBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Ảnh sản phẩm
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Center(
              child: Image.network(
                widget.product.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(height: 10),

          // 2. Giá + Tên
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${widget.product.price}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  widget.product.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // 3. Rating
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 5),
                Text(
                  "${widget.product.rating.rate} ⭐",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange[800],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "${widget.product.rating.count} đánh giá",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // 4. Mô tả
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mô tả sản phẩm",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Text(
                  widget.product.description,
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),

          SizedBox(height: 70), // để né Bottom bar
        ],
      ),
    );
  }

  // Thanh bottom bar
  Widget myBottomBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // --- Nút Chat ngay ---
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Container(
                color: Color(0xFFF6F6F6), // xám nhạt Shopee
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_outline, color: Colors.black87),
                    SizedBox(height: 2),
                    Text("Chat ngay", style: TextStyle(fontSize: 11)),
                  ],
                ),
              ),
            ),
          ),

          // --- Thêm vào giỏ hàng ---
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: double.infinity,
                color: Color(0xFFFFECDD), // cam nhạt Shopee
                child: Center(
                  child: Text(
                    "Thêm vào giỏ",
                    style: TextStyle(
                      color: Color(0xFFEE4D2D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- Mua ngay ---
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: double.infinity,
                color: Color(0xFFEE4D2D), // cam đậm Shopee
                child: Center(
                  child: Text(
                    "Mua ngay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
