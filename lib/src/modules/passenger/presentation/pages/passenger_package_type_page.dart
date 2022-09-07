import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/page_body/passenger_radial_selection_body.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';

class PassengerPackageTypePage extends StatefulWidget {
  const PassengerPackageTypePage({super.key});

  @override
  State<PassengerPackageTypePage> createState() => _PassengerPackageTypePageState();
}

class _PassengerPackageTypePageState extends State<PassengerPackageTypePage> {
  RadialOptionBase? currentRadialOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return PassengerRadialSelectionBody(
      radialList: PassengerRadialOptions.availablePackageTypeList,
      radialGroup: currentRadialOption,
      nextStepCallback: nextStepCallback,
      onBackLeadingPressed: navigateBackToPathSelection,
      onRadialOptionUpdated: onRadialOptionUpdated,
      pageTitle: "Viajante",
      pageSubtitle: "O volume que você pode deslocar tem tamanho similar a que?",
      radialListTitle: "Tamanhos",
    );
  }

  void onRadialOptionUpdated(RadialOptionBase? value) {
    setState(() {
      currentRadialOption = value;
      nextStepCallback = navigateToPackageWeightSelection;
    });
  }

  void navigateToPackageWeightSelection() {
    Navigator.of(context).pushNamed('/passenger/package/weight');
  }

  void navigateBackToPathSelection() {
    Navigator.of(context).pop();
  }
}
