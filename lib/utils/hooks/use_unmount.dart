import 'package:flutter/foundation.dart';
import 'package:flutter_doctors_demo/utils/hooks/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useUnmount(VoidCallback fn) {
  final fnRef = useRef(fn)..value = fn;
  return useEffectOnce(() => () => fnRef.value());
}
