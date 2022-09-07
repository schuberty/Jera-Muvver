import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';

import 'page_body/passenger_radial_selection_body.dart';

class PassengerPackageWeightPage extends StatefulWidget {
  const PassengerPackageWeightPage({super.key});

  @override
  State<PassengerPackageWeightPage> createState() => _PassengerPackageWeightPageState();
}

class _PassengerPackageWeightPageState extends State<PassengerPackageWeightPage> {
  RadialOptionModel? packageWeightOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return PassengerRadialSelectionBody(
      radialList: PassengerRadialOptions.availablePackageWeightList,
      radialGroup: packageWeightOption,
      nextStepCallback: nextStepCallback,
      onBackLeadingPressed: navigateBackToPathSelection,
      onRadialOptionUpdated: onRadialOptionUpdated,
      pageTitle: "Viajante",
      pageSubtitle: "Qual o peso do volume?",
      radialListTitle: "Peso",
      appBarHeight: 54,
    );
  }

  void onRadialOptionUpdated(RadialOptionModel? value) {
    setState(() {
      packageWeightOption = value;
      nextStepCallback = navigateToPackageComplete;
    });
  }

  void navigateToPackageComplete() {}

  void navigateBackToPathSelection() {
    Navigator.of(context).pop();
  }
}
