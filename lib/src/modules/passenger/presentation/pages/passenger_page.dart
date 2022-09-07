import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/page_body/passenger_radial_selection_body.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  RadialOptionBase? currentRadialOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return PassengerRadialSelectionBody(
      radialList: PassengerRadialOptions.availableTransportList,
      radialGroup: currentRadialOption,
      nextStepCallback: nextStepCallback,
      onBackLeadingPressed: navigateBackToHomePage,
      onRadialOptionUpdated: onRadialOptionUpdated,
      pageTitle: "Viajante",
      pageSubtitle: "Qual será o meio de transporte da sua viagem?",
      radialListTitle: "Transporte",
    );
  }

  void onRadialOptionUpdated(RadialOptionBase? value) {
    setState(() {
      currentRadialOption = value;
      nextStepCallback = navigateToPassengerPathSelection;
    });
  }

  void navigateToPassengerPathSelection() {
    Navigator.of(context).pushNamed("/passenger/path");
  }

  void navigateBackToHomePage() {
    Navigator.of(context).pop();
  }
}
