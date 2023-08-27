import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrefixPrinter(
      PrettyPrinter(colors: true, methodCount: 0, printEmojis: false)),
);

void logV(String message) {
  _logger.v(message);
}

void logD(String message) {
  _logger.d(message);
}

void logI(String message) {
  _logger.i(message);
}

void logW(String message) {
  _logger.w(message);
}

void logE(String message, [Error? error, StackTrace? stack]) {
  if (error != null) {
    _logger.e(message, error);
  } else {
    _logger.e(message);
  }
}
