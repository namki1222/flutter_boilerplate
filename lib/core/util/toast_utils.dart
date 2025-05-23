import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast(context, {required String toastText, Duration duration = const Duration(seconds: 2)}) {
    final fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0x99555555),
      ),
      child: Center(
        child: Text(
          toastText,
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );

    // 버튼이 연속으로 눌릴 시, 현재 토스트 창을 제거해버린다.
    fToast.removeCustomToast();

    fToast.showToast(
        child: toast,
        toastDuration: duration,
        positionedToastBuilder: (context, child, gravity) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 20.0,
                child: child,
              ),
            ],
          );
        });
  }

  static void showToastNoContext({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: const Color(0x99555555),
    );
  }
}
