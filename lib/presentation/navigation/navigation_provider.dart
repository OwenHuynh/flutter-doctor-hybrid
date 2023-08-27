import 'package:flutter_doctors_demo/presentation/navigation/navigation_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationProvider = Provider<NavigationHandler>((ref) {
  return NavigationHandler();
});
