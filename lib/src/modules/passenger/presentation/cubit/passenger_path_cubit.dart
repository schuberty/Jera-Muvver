import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_dates_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_type_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_weight_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/transport_type_option_model.dart';

part 'passenger_path_state.dart';

class PassengerPathCubit extends Cubit<PassengerPathState> {
  TransportTypeOptionModel? _transportType;
  TransportDateModel? _packageDates;
  PackageTypeOptionModel? _packageType;
  PackageWeightOptionModel? _packageWeight;

  PassengerPathCubit() : super(PassengerPathInitial());

  set updateTransportType(TransportTypeOptionModel transportType) => _transportType = transportType;
  set updateTransportDate(TransportDateModel packageDates) => _packageDates = packageDates;
  set updatePackageType(PackageTypeOptionModel packageType) => _packageType = packageType;
  set updatePackageWeight(PackageWeightOptionModel packageWeight) => _packageWeight = packageWeight;

  void sendTransportData() {}
}
