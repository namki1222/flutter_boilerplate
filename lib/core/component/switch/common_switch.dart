import 'package:flutter/material.dart';

class CommonSwitch extends StatefulWidget {
  const CommonSwitch({
    super.key,
    required this.isToggled,
    required this.onChanged,
    this.width = 56.0,
    this.height = 26.0,
    this.borderWidth = 1.0,
    this.padding = 1.5,
    this.circleSize = 22.0,
    this.fontSize = 11.0,
  });

  final bool isToggled;
  final ValueChanged<bool> onChanged;

  final double width;
  final double height;
  final double borderWidth;
  final double padding;
  final double circleSize;
  final double fontSize;

  factory CommonSwitch.large({
    required bool isToggled,
    required ValueChanged<bool> onChanged,
  }) {
    return CommonSwitch(
      isToggled: isToggled,
      onChanged: onChanged,
    );
  }

  factory CommonSwitch.small({
    required bool isToggled,
    required ValueChanged<bool> onChanged,
  }) {
    return CommonSwitch(
      isToggled: isToggled,
      onChanged: onChanged,
      width: 44.0,
      height: 22.0,
      borderWidth: 0.85,
      padding: 1.0,
      circleSize: 18.62,
      fontSize: 9.0,
    );
  }

  @override
  State<CommonSwitch> createState() => _CommonSwitchState();
}

class _CommonSwitchState extends State<CommonSwitch> {
  bool get _isToggled => widget.isToggled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!_isToggled),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
            color: _isToggled ? const Color.fromRGBO(11, 50, 121, 1.0) : const Color.fromRGBO(217, 217, 217, 1.0),
            borderRadius: BorderRadius.circular(31.0),
            border: Border.all(
              color: _isToggled ? const Color.fromRGBO(8, 36, 86, 1.0) : const Color.fromRGBO(207, 207, 207, 1.0),
              width: widget.borderWidth,
            )),
        child: Stack(
          children: [
            /* On/Off 텍스트 */
            Align(
              alignment: _isToggled ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: _isToggled ? 5 : 2.0, right: 2.0),
                child: Text(
                  _isToggled ? 'ON' : 'OFF',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widget.fontSize,
                    color: _isToggled ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
            /* 원형 스위치 */
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
              alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
              child: SizedBox(
                width: widget.circleSize,
                height: widget.circleSize,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
