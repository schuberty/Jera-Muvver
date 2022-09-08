import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';
import 'package:jera_muvver/src/shared/extensions.dart';
import 'package:provider/provider.dart';

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

  void navigateToPackageComplete() {
    if (packageWeightOption != null) {
      context.read<PassengerCubit>().updatePackageWeight = packageWeightOption!;

      context.read<PassengerCubit>().sendTransportData();

      Navigator.of(context).pushNamedAndRemoveAll('/passenger/trip_created');
    }
  }

  void navigateBackToPathSelection() {
    Navigator.of(context).pop();
  }
}
