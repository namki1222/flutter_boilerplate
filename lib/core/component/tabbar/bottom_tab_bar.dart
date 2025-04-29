import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../enum/app_router.dart';

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  ConsumerState<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    /// 현재 탭 인덱스
    int _currentIndex = 0;

    /// 탭 별 라우트 목록
    final List<List<dynamic>> _tabRoutes = [
      [
        AppRouter.home.path,
        Image.asset('assets/icons/tab/home_inactive.png', height: 50.0),
        Image.asset('assets/icons/tab/home_active.png', height: 50.0)
      ],
      [
        AppRouter.order.path,
        Image.asset('assets/icons/tab/order_inactive.png', height: 50.0),
        Image.asset('assets/icons/tab/order_active.png', height: 50.0)
      ],
      [
        AppRouter.history.path,
        Image.asset('assets/icons/tab/history_inactive.png', height: 50.0),
        Image.asset('assets/icons/tab/history_active.png', height: 50.0)
      ],
      [
        AppRouter.point.path,
        Image.asset('assets/icons/tab/point_inactive.png', height: 50.0),
        Image.asset('assets/icons/tab/point_active.png', height: 50.0)
      ],
      [AppRouter.my.path, Image.asset('assets/icons/tab/my_inactive.png', height: 50.0), Image.asset('assets/icons/tab/my_active.png', height: 50.0)],
      // [],
    ];

    void changeTab(int index) {
      // 발주 스크린은 push 처리한다.
      if (index == 1) {
        context.push(_tabRoutes[index][0] as String);
        return;
      }
      context.go(_tabRoutes[index][0] as String);

      setState(() {
        _currentIndex = index;
      });
    }

    // 현재 탭 경로가 변경될 경우, _tabRoutes 내의 항목에 맞게 _currentIndex 를 변경한다.
    final currentLocation = widget.state.fullPath;
    if (currentLocation != null) {
      final currentTab = _tabRoutes.indexWhere((element) => element[0] == currentLocation);
      if (currentTab != -1) {
        _currentIndex = currentTab;
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: widget.child,
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.transparent,
          onDestinationSelected: changeTab,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentIndex,
          destinations: _tabRoutes
              .map(
                (e) => NavigationDestination(
                  label: '',
                  icon: e[1],
                  selectedIcon: e[2],
                ),
              )
              .toList(),
        ));
  }
}
