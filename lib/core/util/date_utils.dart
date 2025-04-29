import 'package:intl/intl.dart';

class DateUtil {
  /// yyyy-MM-dd 형태의 스트링인 [rawDashedDate] 를 전달받아 원하는 포매팅을 의미하는 스트링인 [expectedFormat] 형태로 변환한다.
  static String convertRawDashedDateIntoFormatted(String rawDashedDate, String expectedFormat) {
    final DateFormat dateFormatter = DateFormat(expectedFormat);
    final DateTime dateTime = DateTime.parse(rawDashedDate);

    return dateFormatter.format(dateTime);
  }

  /// [DateTime] 을 원하는 [String] 날짜 형태로 포매팅한다.
  ///
  /// 변경할 [DateTime] 인 [dateToBeConverted] 와, 변경할 포맷인 [expectedFormat] 을 전달받는다.
  static String convertDateTimeIntoFormatted(DateTime dateToBeConverted, String expectedFormat) {
    final DateFormat dateFormatter = DateFormat(expectedFormat);

    return dateFormatter.format(dateToBeConverted);
  }

  /// 날짜 형식을 전달받아, 현재 일자로부터 "N일 후" 텍스트를 반환한다.
  static String getDaysAfterText(String date) {
    final DateTime dateTime = DateTime.parse(date).copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    final Duration difference = dateTime.difference(DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0));
    final int days = difference.inDays;

    return days == 1
        ? '내일'
        : days > 0
            ? '$days일 후'
            : days < 0
                ? '마감'
                : '오늘';
  }
}
