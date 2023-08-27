fvm flutter pub run pigeon \
  --input pigeons/navigation.dart\
  --dart_out lib/navigation.dart\
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m \
  --experimental_swift_out ios/Runner/Pigeon.swift \
  --java_out ./android/app/src/main/java/io/flutter/plugins/navigation.java \
  --java_package "io.flutter.plugins"



