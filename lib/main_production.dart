import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/config/flavors.dart';
import 'package:flutter_doctors_demo/initialize.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_doctors_demo/flutter_demo_app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.PRODUCTION;
  await initialize();
  runApp(ProviderScope(child: FlutterDemoApp()));
}
