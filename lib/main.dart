import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/chat_page.dart';
import 'package:go_router_example/dashboard_page.dart';
import 'package:go_router_example/home_page.dart';
import 'package:go_router_example/login_page.dart';
import 'package:go_router_example/page_transition.dart';
import 'package:go_router_example/profile_page.dart';
import 'package:go_router_example/register_page.dart';
import 'package:go_router_example/search_page.dart';
import 'package:go_router_example/setting_page.dart';
import 'package:go_router_example/splash_page.dart';

import 'error_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(
          authenticated: true,
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return DashBoardPage(child: child);
        },
        routes: [
          GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
              pageBuilder: (context, state) =>
                  RouterTransitionFactory.getTransitionPage(
                    context: context,
                    state: state,
                    child: const HomePage(),
                    type: 'scale', // fade|rotation|scale|size
                  ),
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (context, state) => ProfilePage(),
                ),
                GoRoute(
                  path: '/chat',
                  builder: (context, state) {
                    int id = state.extra != null
                        ? state.extra as int
                        : 0; // Extract the message parameter
                    return ChatPage(
                      id: id,
                    );
                  },
                ),
              ]),
          GoRoute(
            path: '/search',
            builder: (context, state) => const SearchPage(),
            pageBuilder: (context, state) =>
                RouterTransitionFactory.getTransitionPage(
              context: context,
              state: state,
              child: const SearchPage(),
              type: 'scale', // fade|rotation|scale|size
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
            pageBuilder: (context, state) =>
                RouterTransitionFactory.getTransitionPage(
              context: context,
              state: state,
              child: const ProfilePage(),
              type: 'scale', // fade|rotation|scale|size
            ),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingPage(),
            pageBuilder: (context, state) =>
                RouterTransitionFactory.getTransitionPage(
              context: context,
              state: state,
              child: const SettingPage(),
              type: 'scale', // fade|rotation|scale|size
            ),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
