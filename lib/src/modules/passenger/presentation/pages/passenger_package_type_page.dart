import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_cancel_text_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/page_body/passenger_radial_selection_body.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';
import 'package:jera_muvver/src/shared/extensions.dart';
import 'package:provider/provider.dart';

class PassengerPackageTypePage extends StatefulWidget {
  const PassengerPackageTypePage({super.key});

  @override
  State<PassengerPackageTypePage> createState() => _PassengerPackageTypePageState();
}

class _PassengerPackageTypePageState extends State<PassengerPackageTypePage> {
  RadialOptionModel? packageTypeOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return PassengerRadialSelectionBody(
      radialList: PassengerRadialOptions.availablePackageTypeList,
      radialGroup: packageTypeOption,
      nextStepCallback: nextStepCallback,
      onBackLeadingPressed: navigateBackToPathSelection,
      onRadialOptionUpdated: onRadialOptionUpdated,
      actions: <Widget>[PassengerCancelTextButton(onPressed: navigateBackToHome)],
      pageTitle: "Viajante",
      pageSubtitle: "O volume que você pode deslocar tem tamanho similar a que?",
      radialListTitle: "Tamanhos",
    );
  }

  void onRadialOptionUpdated(RadialOptionModel? value) {
    setState(() {
      packageTypeOption = value;
      nextStepCallback = navigateToPackageWeightSelection;
    });
  }

  void navigateToPackageWeightSelection() {
    if (packageTypeOption != null) {
      context.read<PassengerCubit>().updatePackageType = packageTypeOption!;

      Navigator.of(context).pushNamed('/passenger/package/weight');
    }
  }

  void navigateBackToHome() {
    Navigator.of(context).pushNamedAndRemoveAll("/");
  }

  void navigateBackToPathSelection() {
    Navigator.of(context).pop();
  }
}
