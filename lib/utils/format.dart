import 'package:intl/intl.dart';

class AppFormats {
  static NumberFormat vnd = NumberFormat.currency(locale: "vi_VN", symbol: "₫");
  static DateFormat datetime = DateFormat("HH:mm EEEE, dd/MM/yyyy");
  static DateFormat date = DateFormat("EEEE, dd/MM/yyyy");
  static DateFormat time = DateFormat("HH:mm");
}
