import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/core/constants/value.dart';
import 'package:todo_app/app/providers/login/login_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifer = ref.read(loginProvider.notifier);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(padding),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                    )),
                    hintText: 'Email'),
                controller: notifer.email,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                  )),
                  hintText: 'Password',
                ),
                controller: notifer.password,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  notifer.login(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
