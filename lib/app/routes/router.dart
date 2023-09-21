import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/app/data/services/local/storage.dart';
import 'package:todo_app/app/routes/path.dart';
import 'package:todo_app/app/screens/home/views/home_page.dart';
import 'package:todo_app/app/screens/login/views/login_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: Paths.login,
        builder: (BuildContext context, GoRouterState state) => LoginView()),
    GoRoute(
        path: Paths.home,
        builder: (BuildContext context, GoRouterState state) => HomePage(),
        redirect: (context, _) => _getRouteName(context)),
  ],
);

String _getRouteName(BuildContext context) {
  String? token = prefs.getString('token');
  return token == null ? Paths.login : Paths.home;
}
