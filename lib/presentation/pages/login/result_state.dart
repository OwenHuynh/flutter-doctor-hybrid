// ignore_for_file: use_setters_to_change_properties

import 'package:hooks_riverpod/hooks_riverpod.dart';

final resultProvider = StateNotifierProvider<ResultNotifier,int>((ref){
  return ResultNotifier();

});

class ResultNotifier extends StateNotifier<int> {
  ResultNotifier() : super(0);

  void setResult(int result){
    state = result;
  }
}
