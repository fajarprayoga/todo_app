import 'package:riverpod/riverpod.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(AppState());

  void navigateTo(int index) {
    state = state.copyWith(page: index);
  }
}

class AppState {
  final int page;

  AppState({this.page = 0});

  AppState copyWith({int? page}) {
    return AppState(page: page ?? this.page);
  }
}

// autoDispose untuk menghapus nilai ketika halaman di tinggalkan
final appProvider =
    StateNotifierProvider.autoDispose<AppNotifier, AppState>((ref) {
  return AppNotifier();
});
