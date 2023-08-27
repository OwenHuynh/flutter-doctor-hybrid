import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/gen/fonts.gen.dart';
import 'package:flutter_doctors_demo/presentation/navigation/auto_slide_route_observer.dart';
import 'package:flutter_doctors_demo/presentation/navigation/navigation_handler.dart';
import 'package:flutter_doctors_demo/presentation/view_models/flutter_demo/flutter_demo_provider.dart';
import 'package:flutter_doctors_demo/utils/hooks/use_mount.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FlutterDemoApp extends HookConsumerWidget {
  const FlutterDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flutterDemoViewModel = ref.watch(flutterDemoProvider.notifier);

    useMount(flutterDemoViewModel.init);

    return RefreshConfiguration(
      footerTriggerDistance: 60,
      dragSpeedRatio: 0.91,
      headerBuilder: MaterialClassicHeader.new,
      footerBuilder: ClassicFooter.new,
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: true,
      shouldFooterFollowWhenNotFull: (state) {
        return false;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: FontFamily.sFProTextRegular),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [
            AutoSlideRouteObserver(),
          ],
        ),
        routeInformationProvider: appRouter.routeInfoProvider(),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ja'),
        ],
        locale: Locale('ja', 'JP'),
      ),
    );
  }
}
