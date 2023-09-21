import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/app/core/constants/dio.dart';
import 'package:todo_app/app/core/constants/theme.dart';
import 'package:todo_app/app/data/services/local/storage.dart';
import 'package:todo_app/app/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  String? token = prefs.getString('token');

  if (token != null) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo App',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      // builder: LazyUi.builder,
    );
  }
}
