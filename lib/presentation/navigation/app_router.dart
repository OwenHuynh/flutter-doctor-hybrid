import 'package:auto_route/auto_route.dart';
import 'package:flutter_doctors_demo/presentation/navigation/auth_guard.dart';
import 'package:flutter_doctors_demo/presentation/pages/pages.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page',
    routes: <AutoRoute>[
      AutoRoute(initial: true, page: LoginPage, guards: [AuthGuard]),
      AutoRoute(page: InitPage),
      AutoRoute(page: HomePage)
    ],
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 400)
class $AppRouter {}
