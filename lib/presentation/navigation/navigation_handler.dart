import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doctors_demo/presentation/navigation/app_router.gr.dart';
import 'package:flutter_doctors_demo/presentation/navigation/auth_guard.dart';

final appRouter = AppRouter(authGuard: AuthGuard());

class NavigationHandler {
  bool? isCurrentScreen(BuildContext? context) {
    if (context == null) {
      return null;
    }

    return ModalRoute.of(context)!.isCurrent;
  }

  String? getCurrentScreen(BuildContext? context) {
    if (context == null) {
      return null;
    }

    return ModalRoute.of(context)!.settings.name;
  }

  Future<void> push({
    BuildContext? context,
    required PageRouteInfo route,
    bool? skipSameRouteCheck,
  }) async {
    final _skipSameRouteCheck = skipSameRouteCheck ?? true;
    final asyncRoute = await buildPageAsync(route: route);
    if (!_skipSameRouteCheck &&
        getCurrentScreen(context) == asyncRoute.routeName) {
      return null;
    }

    await appRouter.push(asyncRoute);
  }

  Future<bool> pop<T extends Object>({T? result}) async {
    return appRouter.pop<T>(result);
  }

  Future<void> popToRoot() async {
    return appRouter.popUntilRoot();
  }

  bool canPopCurrentRoute<T>() {
    return appRouter.canPop();
  }

  Future<void> reset({required PageRouteInfo route}) async {
    return appRouter.pushAndPopUntil<void>(
      route,
      predicate: (r) => false,
    );
  }

  Future<void> resetAll({required PageRouteInfo route}) async {
    return appRouter.replaceAll([route]);
  }

  Future replace({required PageRouteInfo route}) async {
    return appRouter.replace(route);
  }

  Future<void> replaceAll({required List<PageRouteInfo> routes}) async {
    return appRouter.replaceAll(routes);
  }

  Future<PageRouteInfo> buildPageAsync({required PageRouteInfo route}) async {
    return Future.microtask(() {
      return route;
    });
  }
}
