import 'package:flutter_hooks/flutter_hooks.dart';

bool useFirstMountState() {
  final isFirst = useRef(true);

  if (isFirst.value) {
    isFirst.value = false;

    return true;
  }

  return isFirst.value;
}
