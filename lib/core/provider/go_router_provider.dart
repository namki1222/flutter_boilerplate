import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/example/view/example_stateful_screen.dart';
import '../component/tabbar/bottom_tab_bar.dart';
import '../enum/app_router.dart';
import '../view/splash_screen.dart';
import '../view/web_view/term_web_view.dart';
import 'app_router_observer.dart';
import 'auth_provider.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Default Transition 이 필요한 경우 각 GoRoute 메소드 내의 pageBuilder 프로퍼티 내에서 해당 함수를 호출하여 사용한다.
///
/// ex. pageBuilder: (context, state) => buildPageWithDefaultTransition(context: context, state: state, child: const Example2Screen())
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

/// 라우트 집합
final routerConfigProvider = Provider<GoRouter>(
  (ref) {
    final List<RouteBase> routes = [
      // 스플래시 페이지
      GoRoute(
        path: AppRouter.splash.path,
        name: AppRouter.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),

      // 약관 웹뷰
      GoRoute(
        path: AppRouter.webviewTerm.path,
        name: AppRouter.webviewTerm.name,
        builder: (context, state) {
          final termTitle = state.uri.queryParameters['termTitle']!;
          final termUrl = state.uri.queryParameters['termUrl']!;
          return TermWebView(termTitle: termTitle, termUrl: termUrl);
        },
      ),

      // 주소 검색
      // GoRoute(
      //   path: AppRouter.searchAddr.path,
      //   name: AppRouter.searchAddr.name,
      //   builder: (context, state) => const AddressSearchScreen(),
      // ),

      /// Auth
      // GoRoute(
      //   parentNavigatorKey: rootNavigatorKey,
      //   path: AppRouter.auth.path,
      //   name: AppRouter.auth.name,
      //   builder: (context, state) => const AuthScreen(),
      //   routes: <RouteBase>[
      //     // 회원 가입 페이지
      //     GoRoute(
      //       // routes 내부에 선언하여 GoRoute 가 상위 경로를 생략하므로, path 를 name 으로 정의.
      //       // (enum AppRouter 정의한 이름과 path 를 같이 하였음)
      //       parentNavigatorKey: rootNavigatorKey,
      //       path: AppRouter.join.name,
      //       name: AppRouter.join.name,
      //       builder: (context, state) {
      //         final String? loginId = state
      //             .uri.queryParameters['loginId']; // SNS 회원가입 시, SNS Identifier
      //         final String? snsProvider = state.uri.queryParameters[
      //             'snsProvider']; // ex. kakao, naver, apple ...
      //         return JoinScreen(
      //           loginId: loginId,
      //           snsProvider: snsProvider,
      //         );
      //       },
      //       routes: [
      //         GoRoute(
      //           path: AppRouter.joinComplete.subPath,
      //           name: AppRouter.joinComplete.name,
      //           builder: (context, state) => const JoinCompleteScreen(),
      //         ),
      //       ],
      //     ),
      //
      //     // 비밀번호 찾기 페이지
      //     GoRoute(
      //       parentNavigatorKey: rootNavigatorKey,
      //       path: AppRouter.findPassword.name,
      //       name: AppRouter.findPassword.name,
      //       builder: (context, state) => const FindPasswordScreen(),
      //     ),
      //
      //     // // 비밀번호 변경 페이지
      //     GoRoute(
      //       parentNavigatorKey: rootNavigatorKey,
      //       path: AppRouter.findPasswordUpdate.name,
      //       name: AppRouter.findPasswordUpdate.name,
      //       builder: (context, state) {
      //         return const AuthUpdatePasswordScreen();
      //       },
      //     ),
      //   ],
      // ),

      /* 바텀 탭바가 표시할 각 루트 스크린 */
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            BottomTabBar(state: state, child: child),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: AppRouter.home.path,
            name: AppRouter.home.name,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ExampleScreen()),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRouter.homeDetail.subPath,
                name: AppRouter.homeDetail.name,
                builder: (context, state) {
                  final int id = int.parse(state.uri.queryParameters['id']!);
                  final bool isOrder =
                      bool.parse(state.uri.queryParameters['isOrder']!);
                  return ExampleScreen(
                  );
                },
                routes: [
                ],
              ),
            ],
          ),
        ],
      ),
    ];

    final provider = ref.read(authProvider);

    // authProvider 를 구독하고 있다가, userInfo 의 상태가 변경되면 redirectLoic 을 호출시킨다.
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: routes,
      initialLocation: AppRouter.splash.path,
      observers: <NavigatorObserver>[AppRouterObserver()],
      refreshListenable: provider,
      redirect: provider.redirectLogic,
    );
  },
);
