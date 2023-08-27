import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/presentation/pages/pages.dart';
import 'package:flutter_doctors_demo/presentation/view_models/init/init_state.dart';
import 'package:flutter_doctors_demo/utils/constants/app_strings.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(AppStrings.pleaseAddContent),
          ),
        ),
      );
}

List<Widget> buildInitScreen() => [
      HomePage(),
      SearchPage(),
      NoticePage(),
      SettingPage(),
    ];

List<PersistentBottomNavBarItem> navBarsInitScreen() => [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: TabIndex.values[0].title,
        activeColorPrimary: TabIndex.values[0].color,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: TabIndex.values[1].title,
        activeColorPrimary: TabIndex.values[1].color,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message),
        title: TabIndex.values[2].title,
        activeColorPrimary: TabIndex.values[2].color,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: TabIndex.values[3].title,
        activeColorPrimary: TabIndex.values[3].color,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
