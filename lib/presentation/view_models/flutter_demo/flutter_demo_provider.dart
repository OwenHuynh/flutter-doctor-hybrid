import 'package:flutter_doctors_demo/presentation/navigation/navigation_provider.dart';
import 'package:flutter_doctors_demo/presentation/view_models/flutter_demo/flutter_demo_state.dart';
import 'package:flutter_doctors_demo/presentation/view_models/flutter_demo/flutter_demo_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flutterDemoProvider =
    StateNotifierProvider.autoDispose<FlutterDemoViewModel, FlutterDemoState>(
  (ref) {
    final navigation = ref.watch(navigationProvider);

    return FlutterDemoViewModel(
      navigationHandler: navigation,
    );
  },
);
