// lib/helpers/routers.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uehmobile/widgets/login.dart';
import 'package:uehmobile/widgets/register.dart';
import 'package:uehmobile/widgets/dashboard.dart';
import 'package:uehmobile/widgets/home.dart';
import 'package:uehmobile/widgets/notification.dart';
import 'package:uehmobile/widgets/check_in.dart';
import 'package:uehmobile/widgets/profile.dart';

class UEHRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      // 1. Các trang không có "khung" (Login, Register)
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(title: "Đăng nhập"),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(title: "Đăng ký"),
      ),

      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return DashboardPage(child: child);
        },


        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/notification',
            builder: (BuildContext context, GoRouterState state) {
              return const NotificationPage();
            },
          ),
          GoRoute(
            path: '/check-in',
            builder: (BuildContext context, GoRouterState state) {
              return const CheckInPage();
            },
          ),
          GoRoute(
            path: '/profile',

            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePageBody();
            },

            pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const ProfilePageBody(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
            position: animation.drive(
            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(
            CurveTween(curve: Curves.easeInOut),
            ),
            ),
             child: child,
             );
            },
            );
           },
          ),
        ],
      ),
    ],
  );
}