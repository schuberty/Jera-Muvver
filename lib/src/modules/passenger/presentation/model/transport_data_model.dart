import 'package:jera_muvver/src/shared/utils.dart';

class TransportDataModel {
  final DateTime departureDate;
  final DateTime arrivalDate;
  final String originCity;
  final String destinationCity;

  TransportDataModel({
    required this.departureDate,
    required this.arrivalDate,
    required this.originCity,
    required this.destinationCity,
  });

  @override
  String toString() {
    return 'TransportData(${formatDate(departureDate)}, ${formatDate(arrivalDate)}, $originCity, $destinationCity)';
  }
}
