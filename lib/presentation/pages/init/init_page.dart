import 'package:flutter/material.dart';
import 'package:flutter_doctors_demo/presentation/pages/init/child/child_pages.dart';
import 'package:flutter_doctors_demo/presentation/view_models/init/init_provider.dart';
import 'package:flutter_doctors_demo/presentation/view_models/init/init_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class InitPage extends StatefulHookConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _InitPageState();
}

class _InitPageState extends ConsumerState<InitPage> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  @override
  Widget build(final BuildContext context) {
    final state = ref.watch(initProvider);
    final viewModel = ref.read(initProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.tabIndex.title),
        backgroundColor: state.tabIndex.color,
        centerTitle: true,
        leading: GestureDetector(
          onTap: viewModel.logout,
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: WillPopScope(
        onWillPop: viewModel.logout,
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: buildInitScreen(),
          items: navBarsInitScreen(),
          resizeToAvoidBottomInset: true,
          selectedTabScreenContext: (context) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              viewModel.setTabIndex(_controller.index);
            });
          },
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: Colors.black,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle.style13,
        ),
      ),
    );
  }
}
