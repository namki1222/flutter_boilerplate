import 'dart:convert';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../firebase_options.dart';
import '../constant/data.dart';
import 'core_utils.dart';

part 'firebase_utils.g.dart';

@Riverpod(keepAlive: true)
class FirebaseUtils extends _$FirebaseUtils {
  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
    debugPrint('===> context=${_context?.mounted.toString()}');
  }

  @override
  void build() {}

  /// Firebase 초기화
  Future<Uri?> initFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return null;
  }

  /// 플러터 FCM 플러그인을 초기화한다. 초기화 위치는 main.dart 내 main 함수이다.
  ///
  /// 1. FCM 플러그인의 초기 세팅을 수행한다.
  /// 2. FCM 을 디바이스 팝업에 띄우기 위한 OS 별 FlutterLocalNotification 을 초기화한다.
  Future<void> doInitFcm() async {
    // FireBase 초기화
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission(); // AOS 13 버전 이상 대응
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(
        const AndroidNotificationChannel('high_importance_channel', 'high_importance_notification', importance: Importance.max));

    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null && _context != null) {
          try {
            final parsed = jsonDecode(details.payload!);
            CoreUtils.deepLinkMoveToSpecificScreen(_context!, parsed, ref: ref);
          } catch (err, stack) {
            debugPrint('===> 처리 중 오류가 발생했습니다.');
            debugPrint(err.toString());
            debugPrint(stack.toString());
          }
        } else {
          debugPrint('===> No payload or context!');
        }
      },
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// 기기 고유의 FCM 토큰을 반환한다.
  Future<String?> getFcmToken() async {
    return FirebaseMessaging.instance.getToken();
  }

  /// 앱이 동작 중일 시, Stream 을 통해 FCM 을 수신하여 Notification 을 실행하기 위한 리스너를 정의한다.
  ///
  /// main.dart 내 앱 위젯 initState 내에 정의한다.
  void attachFcmListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Foreground FCM 수신');
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        if (Platform.isAndroid) {
          FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel',
                'high_importance_notification',
                importance: Importance.max,
              ),
            ),
            payload: jsonEncode(message.data),
          );
        }
      }
    });
  }

  /* 서버에 FCM 토큰을 등록한다.
  /  [userId] 는 Optional 이며, 로그인 시 해당 userId 를 통해 서버로 전달할 경우, FCM 9토큰이 해당 userId 에 귀속된다.
  */
  Future<void> registerFcmTokenToServer({int? userId}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseHostV1,
          method: 'POST',
          contentType: 'application/json',
        ),
      );

      final fcmToken = await getFcmToken();

      if (fcmToken != null) {
        late final String deviceId;
        // 기기 고유키를 받아온 후, Request DTO 에 반영한다.
        if (Platform.isAndroid) {
          const androidId = AndroidId();
          deviceId = (await androidId.getId())!;
        } else {
          final deviceInfo = await DeviceInfoPlugin().iosInfo;
          deviceId = deviceInfo.identifierForVendor!;
        }

        debugPrint('===> Device ID=$deviceId');

        // final requestDto = NotificationReqRegister(
        //   deviceId: deviceId,
        //   notificationToken: fcmToken,
        //   userId: userId,
        // );
        // await dio.post('/notification/register', data: requestDto.toJson());
        debugPrint('FCM 토큰을 등록했습니다.');
      } else {
        debugPrint('FCM 토큰 등록에 실패했습니다. 토큰을 등록하지 않습니다.');
      }
    } catch (err, stack) {
      debugPrint(err.toString());
      debugPrint(stack.toString());

      throw Exception('서버로 FCM 토큰 전송 중 오류가 발생했습니다.');
    }
  }
}
