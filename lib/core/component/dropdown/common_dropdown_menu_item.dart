import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class CommonDropdownMenuItem extends DropdownMenuItem {
  const CommonDropdownMenuItem({
    super.key,
    required super.value,
    required super.child,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      value: value,
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.grey100, width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
    );
  }
}
