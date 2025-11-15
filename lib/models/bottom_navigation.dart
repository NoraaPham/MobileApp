// lib/models/bottom_navigation.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);


  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/notification')) {
      return 1;
    }
    if (location.startsWith('/check-in')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }


  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/notification');
        break;
      case 2:
        context.go('/check-in');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          label: 'Thông báo',
          activeIcon: Badge(
            label: const Text('18'),
            child: const Icon(Icons.notifications),
          ),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: 'Điểm danh',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ],
      currentIndex: _calculateSelectedIndex(context), //
      onTap: (index) => _onItemTapped(index, context), //

      // Style
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue[700],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}