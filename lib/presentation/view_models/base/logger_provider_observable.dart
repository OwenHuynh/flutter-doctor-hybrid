import 'package:flutter_riverpod/flutter_riverpod.dart';

final kDebugLoggerProvider = true;

class LoggerProviderObservable extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''\x1B[32m
[Observable] ${provider.runtimeType}:
{
  "newValue" : "$newValue"
}\x1B[0m''');
  }
}
