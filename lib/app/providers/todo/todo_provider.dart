import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_app/app/data/api/api.dart';
import 'package:todo_app/app/data/models/todo.dart';

class TodoNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  TodoNotifier() : super(const AsyncValue.data([])) {
    getTodo();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future getTodo() async {
    try {
      final response = await TodoApi.getTodo();
      List data = response['data']?['data'] ?? [];

      List<Todo> todos = data.map((e) => Todo.fromJson(e)).toList();
      state = AsyncData(todos);
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
final todoProvider =
    StateNotifierProvider.autoDispose<TodoNotifier, AsyncValue<List<Todo>>>(
        (ref) {
  return TodoNotifier();
});
