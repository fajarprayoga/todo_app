import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/core/constants/value.dart';
import 'package:todo_app/app/core/extensions/provider_extension.dart';
import 'package:todo_app/app/data/services/local/storage.dart';
import 'package:todo_app/app/providers/app_provider.dart';
import 'package:todo_app/app/screens/account/views/account_view.dart';
import 'package:todo_app/app/screens/home/views/home_views.dart';
import 'package:todo_app/app/screens/support/views/support_view.dart';
import 'package:todo_app/app/screens/todo/views/todo_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // prefs.remove('token');

    List<Widget> pages = [HomeView(), TodoView(), SupportView(), AccountView()];

    return Scaffold(
        body: appProvider.watch((state) {
          return Stack(
            children: [
              ...List.generate(pages.length, (i) {
                bool active = state.page == i;
                // Ignore pointer agar focus ke layar yang aktif atau halaman berapa yang aktif
                return IgnorePointer(
                  ignoring: !active,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: active ? 1 : 0,
                    child: Navigator(
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute(
                            builder: (context) => pages[i], settings: settings);
                      },
                    ),
                  ),
                );
              })
            ],
          );
        }),
        bottomNavigationBar: appProvider.watch((state) => Stack(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    ...List.generate(pages.length, (i) {
                      List<IconData> icons = [
                        Icons.home,
                        Icons.note,
                        Icons.support,
                        Icons.account_circle
                      ];

                      Color color =
                          state.page == i ? Colors.black87 : Colors.black26;
                      return Expanded(
                          child: InkWell(
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        onTap: () {
                          final notifier = ref.read(appProvider.notifier);
                          notifier.navigateTo(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(padding),
                          child: Icon(
                            icons[i],
                            color: color,
                          ),
                        ),
                      ));
                    })
                  ],
                )),
              ),

              // indicator
              AnimatedPositioned(
                  curve: Curves.elasticInOut,
                  top: 0,
                  left: MediaQuery.of(context).size.width / 4 * state.page,
                  duration: Duration(milliseconds: 350),
                  child: Container(
                    height: 2,
                    color: Colors.blueAccent,
                    width: MediaQuery.of(context).size.width / 4,
                  )),
            ])));
  }
}
