import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class NavigationAPI {
  int navigate();
  int passData(String value);
}
