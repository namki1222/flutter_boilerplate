import 'package:flutter/material.dart';
import 'package:  /core/component/buttons/common_filled_l_button.dart';
import 'package:  /core/constant/app_colors.dart';
import 'package:  /core/constant/app_text_styles.dart';

class NoListWidget extends StatelessWidget {
  const NoListWidget({required this.text, this.isButton = false, this.buttonText, this.onButtonPressed, super.key});

  final String text;
  final bool isButton;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    if (isButton && (buttonText == null || onButtonPressed == null)) {
      throw Exception('isButton 값이 true 면 buttonText 와 onButtonPressed 는 필수 입력 값입니다');
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/common/empty_list.png',
          height: 76.0,
        ),
        SizedBox(height: 24.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.headline1.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.grey740,
          ),
        ),
        if (isButton)
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: SizedBox(
              width: 120.0,
              height: 40.0,
              child: CommonFilledLButton.p500(
                text: buttonText!,
                onPressed: onButtonPressed!,
              ),
            ),
          ),
      ],
    );
  }
}
