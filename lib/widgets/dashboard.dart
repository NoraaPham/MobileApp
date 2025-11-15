// lib/widgets/dashboard.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/drawer.dart';
import '../models/bottom_navigation.dart';
// ===========================================


class DashboardPage extends StatelessWidget {
  final Widget child; //

  const DashboardPage({
    Key? key,
    required this.child, //
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "UEH Mobile", // Tiêu đề chung
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              context.go('/login');
            },
          ),
        ],
      ),


      drawer: const AppDrawer(),


      body: child,


      bottomNavigationBar: const BottomNavigation(),
    );
  }
}