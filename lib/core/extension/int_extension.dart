import 'package:intl/intl.dart';

extension IntExtension on int {
  String toPriceFormat() {
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }

  String toWon() {
    return toPriceFormat();
  }
}
