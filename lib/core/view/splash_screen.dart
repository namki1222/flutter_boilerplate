import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant/app_images.dart';
import '../layout/default_layout.dart';
import '../provider/go_router_provider.dart';
import '../util/firebase_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static get routeName => 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    //할 행동을 여기에 그냥 간단하게 정리해버린다

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Container(
        // 스플래시 스크린에 대한 이미지가 필요할 경우, BoxDecoration 을 통해 지정한다.
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('asset/images/splash/splash_background_image@3x.png'),
        //   )
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(AppImages.imageCommonLogoHorizontal,
                  height: 35.5),
            )
          ],
        ),
      ),
    );
  }
}
