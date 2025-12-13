import 'package:flutter/material.dart';
import 'package:flutter_nhom4/danhSachBaiTap/api.dart';
import 'package:flutter_nhom4/danhSachBaiTap/my_detail_product.dart';
import 'package:flutter_nhom4/danhSachBaiTap/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test_api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: FutureBuilder(
        future: test_api.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return myListView(snap.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: myBottomBar(),
    );
  }

  //Tiêu đề
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

  Widget myListView(List<Product> ls) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.52,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12, // tỉ lệ giúp ô vuông đẹp
      ),
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          // GestureDetector là Widget bắt sự kiện chạm/ click của người dùng
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyDetailProduct(product: ls[index]),
              ),
            );
          },
          child: myItem(ls[index]),
        );
      },
    );
  }

  Widget myItem(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh sản phẩm
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(p.image, fit: BoxFit.contain),
          ),

          // TẤT CẢ PHẦN DƯỚI GOM VÀO 1 EXPANDED
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 4),

                  // Giá
                  Text(
                    "\$${p.price}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 4),

                  // Rating
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF9C4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow[800], size: 16),
                        SizedBox(width: 4),
                        Text(
                          "${p.rating.rate} (${p.rating.count})",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[900],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(), // 🔥 ĐẨY NÚT XUỐNG ĐÁY
                  // Nút thêm giỏ
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 38),
                        backgroundColor: Color(0xFFF53D2D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Thêm vào giỏ hàng thành công'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text("Thêm vào giỏ"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Thanh điều hướng dưới cùng
  Widget myBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // để hiện đủ icon
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex, // cần khai báo biến này
      onTap: (index) {
        setState(() {
          _currentIndex =
              index; // cập nhật chỉ số hiện tại để đổi màu icon đang chọn
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Mall'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
      ],
    );
  }
}
