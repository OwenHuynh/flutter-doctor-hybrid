import 'package:flutter_doctors_demo/presentation/navigation/navigation_provider.dart';
import 'package:flutter_doctors_demo/presentation/view_models/home/home_state.dart';
import 'package:flutter_doctors_demo/presentation/view_models/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) {
    final navigationHandler = ref.watch(navigationProvider);

    return HomeViewModel(
      navigationHandler: navigationHandler,
    );
  },
);
