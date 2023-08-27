import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BaseAppNotifier<S> extends StateNotifier<S> {
  BaseAppNotifier(S state) : super(state);

  void setState(S Function(S state) update) {
    if (!mounted) {
      return;
    }

    final newState = update(state);
    if (!const DeepCollectionEquality().equals(state, newState)) {
      state = newState;
    }
  }
}
