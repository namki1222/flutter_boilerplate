import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

/// 앱 내에서 전역적으로 사용되는 상단 탭 바
///
/// 사용 시, 부모 위젯에서 탭 컨트롤러를 반드시 초기화시킨 후 파라미터로 넘겨주어야한다.
class CommonTabBar extends StatelessWidget {
  /// 탭을 제어하기 위한 컨트롤러
  final TabController tabController;

  /// 탭을 표현하기 위한 탭 리스트
  final List<Widget> tabList;

  /// 스크롤 가능 여부 (false 일 경우, spaceBetween 처럼 동작한다.)
  ///
  /// 기본값: true
  final bool isScrollable;

  /// 라벨 패딩
  final EdgeInsetsGeometry? labelPadding;

  final TabBarIndicatorSize indicatorSize;

  /// Divider 사용 여부
  final bool showDivider;

  final Color labelColor;
  final Color indicatorColor;

  /// 탭 클릭 시 콜백 :: Optional
  final Function(int index)? onTap;

  const CommonTabBar({
    required this.tabController,
    required this.tabList,
    this.isScrollable = true,
    this.labelPadding,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.onTap,
    this.showDivider = true,
    this.labelColor = Colors.black,
    this.indicatorColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 26.0,
      child: TabBar.secondary(
        controller: tabController,
        splashFactory: NoSplash.splashFactory,
        onTap: onTap,
        isScrollable: isScrollable,
        tabAlignment: isScrollable ? TabAlignment.start : null,
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        labelPadding: labelPadding ?? EdgeInsets.symmetric(horizontal: 0.0),
        labelColor: labelColor,
        labelStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: indicatorColor,
        unselectedLabelColor: AppColors.grey500,
        indicatorSize: indicatorSize,
        indicatorWeight: 3.0,
        dividerColor: showDivider ? AppColors.grey500 : Colors.white,
        tabs: tabList,
      ),
    );
  }
}
