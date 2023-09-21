import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/core/constants/value.dart';
import 'package:todo_app/app/providers/todo/todo_provider.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(todoProvider);

        return state.when(
            data: (todos) {
              if (todos.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              }

              return ListView(
                  children: List.generate(todos.length, (i) {
                String title = todos[i].title ?? '-';
                return Container(
                  padding: EdgeInsets.all(padding),
                  child: Text(title),
                );
              }));
            },
            error: (e, s) => Center(
                  child: Text("Error: $e"),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      }),
    );
  }
}
