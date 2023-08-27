import 'dart:async';

import 'package:flutter_doctors_demo/presentation/view_models/base/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class ViewModel<S> extends StateNotifier<S> {
  ViewModel(S state) : super(state);
}

abstract class BaseViewModel<S extends BaseState> extends ViewModel<S> {
  BaseViewModel(S state) : super(state) {
    onInit();
  }

  final List<StreamSubscription> _streamSubscriptions =
      List.empty(growable: true);

  @protected
  void onInit();

  void setState(S Function(S state) update) {
    if (!mounted) {
      return;
    }

    final newState = update(state);
    if (!const DeepCollectionEquality().equals(state, newState)) {
      state = newState;
    }
  }

  void listen<T>(
      {required Stream<T> stream,
      required void Function(T data) onData,
      Function(Object error)? onError}) {
    final subscription = stream.listen(onData)..onError(onError);
    _streamSubscriptions.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }
}
