import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/page_body/passenger_radial_selection_body.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';
import 'package:provider/provider.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  RadialOptionModel? transportOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return PassengerRadialSelectionBody(
      radialList: PassengerRadialOptions.availableTransportList,
      radialGroup: transportOption,
      nextStepCallback: nextStepCallback,
      onBackLeadingPressed: navigateBackToHomePage,
      onRadialOptionUpdated: onRadialOptionUpdated,
      pageTitle: "Viajante",
      pageSubtitle: "Qual será o meio de transporte da sua viagem?",
      radialListTitle: "Transporte",
    );
  }

  void onRadialOptionUpdated(RadialOptionModel? value) {
    setState(() {
      transportOption = value;
      nextStepCallback = navigateToPassengerPathSelection;
    });
  }

  void navigateToPassengerPathSelection() {
    if (transportOption != null) {
      context.read<PassengerCubit>().updateTransportType = transportOption!;

      Navigator.of(context).pushNamed("/passenger/path");
    }
  }

  void navigateBackToHomePage() {
    Navigator.of(context).pop();
  }
}
