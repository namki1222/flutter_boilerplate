import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/custom_scroll_behavior.dart';
import 'core/constant/app_colors.dart';
import 'core/constant/data.dart';
import 'core/provider/go_router_provider.dart';
import 'core/provider/secure_storage_provider.dart';
import 'core/provider/shared_prefs_provider.dart';
import 'core/util/core_utils.dart';
import 'core/util/firebase_utils.dart';
import 'core/util/jwt_utils.dart';

/// TODO: 앱의 엔트리 포인트를 지정한다. 이때, 엔트리포인트 클래스의 이름은 프로젝트 명으로 정한다.
class BoilerPlate  extends ConsumerStatefulWidget {
  const BoilerPlate ({super.key});

  @override
  ConsumerState<BoilerPlate> createState() => _BoilerPlateState();
}

class _BoilerPlateState extends ConsumerState<BoilerPlate> {
  @override
  initState() {
    super.initState();

    // 토큰 체크 (로그성)
    ref.read(firebaseUtilsProvider.notifier).getFcmToken().then((value) => debugPrint('===> FCM Token=$value'));

    // 앱이 동작 중일 시, Stream 을 통해 FCM 을 수신하여 Notification 을 실행하기 위한 리스너를 정의한다.
    ref.read(firebaseUtilsProvider.notifier).attachFcmListener();

    // SecureStoageProvider 에서 JWT 토큰을 해독하여, null 이 아닐 경우(로그인 되어있을 경우) 해당 유저의 고유키를 서버에 FCM 토큰을 귀속시킨다.
    // 만일, null 일 경우, 토큰만 서버로 전송한다.
    ref.read(secureStorageProvider).read(key: ACCESS_TOKEN_KEY).then((aT) async {
      if (aT != null) {
        debugPrint('로그인된 유저입니다. FCM 토큰을 서버로 전송합니다. aT=$aT');
        final parsedJwt = JwtUtils.parseJwtPayLoad(aT);
        final userId = parsedJwt['id'];

        ref.read(firebaseUtilsProvider.notifier).registerFcmTokenToServer(userId: userId);
      } else {
        debugPrint('로그인되어 있지 않은 유저입니다. FCM 토큰을 서버로 전송합니다.');
        ref.read(firebaseUtilsProvider.notifier).registerFcmTokenToServer();
      }
    });

    _getInitFcm();
  }

  void _getInitFcm() async {
    log('[App.dart] _getInitFcm 호출');
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (!context.mounted) return;

    if (initialMessage?.data != null) {
      CoreUtils.deepLinkMoveToSpecificScreen(rootNavigatorKey.currentContext!, initialMessage!.data, widgetRef: ref);
    }
    // print('FCM 호출되었다요');
    // final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    // if (!context.mounted) return;
    //
    // if (initialMessage?.data != null) {
    //   CoreUtils.deepLinkMoveToSpecificScreen(context, initialMessage!.data, widgetRef: ref);
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 초기 앱 환경을 세팅한다.
  @override
  Widget build(BuildContext context) {
    final routerConfig = ref.watch(routerConfigProvider);
    ref.watch(sharedPrefsProvider);

    // 기기 Portrait, Landscape 세팅 로직, 기본 값으로 portrait 로 지정된다.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // 데이터 포맷팅 활성화 (DateTime to String 으로 원하는 형태로 포맷팅 할 수 있다.)
    initializeDateFormatting();

    // ScreenUtils 활성화
    return MaterialApp.router(
      builder: (context, child) {
        // AOS 환경에서 ScrollView 에 대한 상단 파란색 Glow 를 해제한다. 필요 없을 경우 해제하고, child 를 return 하면 된다.
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: Container(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxWidth),
                child: child!,
              ),
            ),
          ),
        );
      },
      // 라우트 콘피그 (go_router_provider.dart) 적용, 전체 앱은 GoRouter 의 영향을 받는다.
      routerConfig: routerConfig,
      // 기본 폰트 지정
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary500),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surfaceTint: Colors.white,
        ),
        canvasColor: Colors.white,
        dividerColor: AppColors.grey500,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.white,
        ),
        // splashFactory: NoSplash.splashFactory,
        // hoverColor: Colors.transparent,
        // highlightColor: Colors.red,
        // colorScheme: const ColorScheme.light(
        //   primary: AppColor.green500,
        //   surfaceTint: Colors.white,
        // ),
      ),
    );
  }
}
