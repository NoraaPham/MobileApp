import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  // Màu cam
  static const Color drawerColor = Color(0xFFE8955E);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header (Phần trắng chứa logo)
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Center(
              child: Image.asset(
                'images/Logo_UEH.png', // Dùng logo của bạn
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Body (Phần list màu cam)
          Expanded(
            child: Container(
              color: drawerColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(context, icon: Icons.article, text: 'Tin tức UEH'),
                  _buildDrawerItem(context, icon: Icons.event, text: 'Sự kiện UEH'),
                  _buildDrawerItem(context, icon: Icons.school, text: 'Xem điểm'),
                  _buildDrawerItem(context, icon: Icons.calendar_today, text: 'Thời khóa biểu'),
                  _buildDrawerItem(context, icon: Icons.schedule, text: 'Lịch thi'),
                  _buildDrawerItem(context, icon: Icons.directions_bus, text: 'UEH Go Green Station'),
                  _buildDrawerItem(context, icon: Icons.phone, text: 'Liên hệ trực tiếp UEH'),
                  _buildDrawerItem(context, icon: Icons.check_circle, text: 'Đã điểm danh'),
                  _buildDrawerItem(context, icon: Icons.sports_soccer, text: 'Hoạt động ngoại khóa'),
                  _buildDrawerItem(context, icon: Icons.work, text: 'Công việc làm UEH'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {

        Navigator.pop(context);

      },
    );
  }
}