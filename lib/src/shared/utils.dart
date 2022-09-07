import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat("dd/MM/yyyy").format(date);
}

DateTime parseDate(String string) {
  return DateFormat("dd/MM/yyyy").parse(string);
}
