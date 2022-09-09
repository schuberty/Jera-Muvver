import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/transport_data_model.dart';

part 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerState> {
  RadialOptionModel? _transportType;
  TransportDataModel? _packageDates;
  RadialOptionModel? _packageType;
  RadialOptionModel? _packageWeight;

  PassengerCubit() : super(PassengerPathInitial());

  set updateTransportType(RadialOptionModel transportType) => _transportType = transportType;
  set updateTransportDate(TransportDataModel packageDates) => _packageDates = packageDates;
  set updatePackageType(RadialOptionModel packageType) => _packageType = packageType;
  set updatePackageWeight(RadialOptionModel packageWeight) => _packageWeight = packageWeight;

  void sendTransportData() {
    print(_transportType);
    print(_packageDates);
    print(_packageType);
    print(_packageWeight);
  }
}
