import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:provider/provider.dart';

final passengerModule = <Provider>[
  Provider<PassengerCubit>(
    create: (context) => PassengerCubit(),
  ),
];
