import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_app/app/core/constants/dio.dart';
import 'package:todo_app/app/core/constants/string.dart';
import 'package:todo_app/app/data/services/local/storage.dart';
import 'package:todo_app/app/routes/path.dart';

class LoginNotifier extends StateNotifier<AppState> {
  LoginNotifier() : super(AppState());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(BuildContext context) async {
    try {
      if (email.text.trim().isEmpty) {
        print("Email is requried");
      } else if (password.text.trim().isEmpty) {
        print("Password is requried");
      } else {
        final payload = {'email': email.text, 'password': password.text};

        final response = await dio.post(baseUrl('auth/login'), data: payload);
        print(response);

        // final map = json.decode(response.data);

        if (response.statusCode == 200) {
          // print(map['message'] ?? 'Sukses');
          String token = response.data?['token'] ?? '';
          prefs.setString('token', token);

          dio.options.headers['Authorization'] = 'Bearer ' + token;

          if (context.mounted) {
            context.go(Paths.home);
          }
        }
      }
    } catch (e) {
      print('error: $e');
    }
  }
}

class AppState {
  // final int page;

  // AppState({this.page = 0});

  // AppState copyWith({int? page}) {
  //   return AppState(page: page ?? this.page);
  // }
}

// autoDispose untuk menghapus nilai ketika halaman di tinggalkan
final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, AppState>((ref) {
  return LoginNotifier();
});
