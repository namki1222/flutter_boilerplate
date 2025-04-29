import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';

class CommonDropdownUpper extends StatefulWidget {
  /// 메뉴 아이템이 위로 펼쳐지는 형태의 드롭다운
  const CommonDropdownUpper({
    super.key,
    required this.items,
    this.hintText,
    this.value,
    required this.onChanged,
    this.selectedItemBuilder,
  });

  /// 드롭다운 아이템
  final List<DropdownMenuItem> items;

  /// 힌트 텍스트
  final String? hintText;

  final dynamic value;

  /// 값 선택 시 핸들러
  final ValueChanged<dynamic>? onChanged;

  final List<Widget> Function(BuildContext context)? selectedItemBuilder;

  @override
  State<CommonDropdownUpper> createState() => _CommonDropdownUpperState();
}

class _CommonDropdownUpperState extends State<CommonDropdownUpper> {
  @override
  Widget build(BuildContext context) {
    const height = 50.0;
    final commonOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blueGrey300),
      borderRadius: BorderRadius.circular(8.0),
    );

    return DropdownButtonFormField2(
      value: widget.value,
      hint: Text(widget.hintText ?? '선택'),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        enabledBorder: commonOutlineInputBorder.copyWith(borderSide: const BorderSide(color: AppColors.blueGrey300)),
        focusedBorder: commonOutlineInputBorder.copyWith(borderSide: const BorderSide(color: AppColors.primary500)),
      ),
      dropdownStyleData: DropdownStyleData(
        offset: Offset(0.0, 105.0 + (height * (widget.items.length - 1))),
        openInterval: const Interval(0.0, 0.0),
        elevation: 0,
        decoration: BoxDecoration(border: Border.all(color: AppColors.primary500, width: 1.0), borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(1.0),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: height,
        padding: EdgeInsets.zero,
      ),
      buttonStyleData: const ButtonStyleData(
        width: double.infinity,
      ),
      iconStyleData: IconStyleData(
        openMenuIcon: Image.asset(
          'assets/icons/common/grey_fill_bottom_arrow.png',
          color: AppColors.primary500,
          height: 10.0,
        ),
        icon: Image.asset(
          'assets/icons/common/grey_fill_bottom_arrow.png',
          color: AppColors.blueGrey300,
          height: 10.0,
        ),
      ),
      style: AppTextStyles.body1.copyWith(fontWeight: FontWeight.w500, color: AppColors.grey800),
      items: widget.items,
      onChanged: (value) {
        setState(() {
          widget.onChanged!(value);
        });
      },
      selectedItemBuilder: widget.selectedItemBuilder,
    );
  }
}
