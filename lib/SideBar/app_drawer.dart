import 'package:flutter/material.dart';
import 'package:flutter_nhom4/danhSachBaiTap/danh_sach_bai_tap.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/u-i-a-cat-deo-kinh.jpg',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Danh sách bài tập",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Nhóm 4 - LTDD", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          ...exercises.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // Lưu navigator trước khi vào async
                    final navigator = Navigator.of(context);

                    // delay để splash hiển thị
                    Future.delayed(const Duration(milliseconds: 250), () {
                      // kiểm tra mounted trước khi dùng context
                      if (!navigator.context.mounted) return;

                      navigator.pop(); // đóng drawer
                      navigator.push(
                        MaterialPageRoute(builder: (_) => e.screen),
                      );
                    });
                  },

                  splashColor: Colors.deepPurple.withAlpha((0.2 * 255).round()),
                  highlightColor: Colors.deepPurple.withAlpha(
                    (0.1 * 255).round(),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withAlpha(
                            (0.05 * 255).round(),
                          ),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.assignment,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        e.title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.deepPurple,
                      ),
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
