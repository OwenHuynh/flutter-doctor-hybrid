import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/presentation/view_models/base/base_state.dart';
import 'package:flutter_doctors_demo/utils/base/page_state.dart';
import 'package:flutter_doctors_demo/utils/constants/app_strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_state.freezed.dart';

@freezed
class InitState with _$InitState implements BaseState {
  factory InitState({
    @Default(PageState.initial) PageState pageState,
    @Default(TabIndex.home) TabIndex tabIndex,
  }) = _InitState;
}

enum TabIndex { home, search, notice, setting }

extension TabIndexExt on TabIndex {
  int get index {
    switch (this) {
      case TabIndex.home:
        return 0;
      case TabIndex.search:
        return 1;
      case TabIndex.notice:
        return 2;
      case TabIndex.setting:
        return 3;
    }
  }

  String get title {
    switch (this) {
      case TabIndex.home:
        return AppStrings.homeTitle;
      case TabIndex.search:
        return AppStrings.searchTitle;
      case TabIndex.notice:
        return AppStrings.noticeTitle;
      case TabIndex.setting:
        return AppStrings.settingTitle;
    }
  }

  Color get color {
    switch (this) {
      case TabIndex.home:
        return Colors.blue;
      case TabIndex.search:
        return Colors.teal;
      case TabIndex.notice:
        return Colors.deepOrange;
      case TabIndex.setting:
        return Colors.indigo;
    }
  }
}
