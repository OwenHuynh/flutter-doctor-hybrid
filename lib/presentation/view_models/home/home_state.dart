import 'package:flutter_doctors_demo/presentation/view_models/base/base_state.dart';
import 'package:flutter_doctors_demo/utils/base/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_doctors_demo/domain/entities/user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState implements BaseState {
  factory HomeState({
    User? user,
    @Default(PageState.initial) PageState pageState,
  }) = _HomeState;
}
