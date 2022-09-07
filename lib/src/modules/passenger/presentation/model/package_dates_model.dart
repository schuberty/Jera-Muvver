import 'package:jera_muvver/src/shared/utils.dart';

class TransportDateModel {
  final DateTime departureDate;
  final DateTime arrivalDate;

  TransportDateModel({
    required this.departureDate,
    required this.arrivalDate,
  });

  @override
  String toString() {
    return 'TransportDate(${formatDate(departureDate)}, ${formatDate(arrivalDate)}';
  }
}
