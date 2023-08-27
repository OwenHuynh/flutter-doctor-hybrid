import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    resolver.next(true);
  }
}
