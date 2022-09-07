import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/data/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_radial_list_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';

class PassengerPackageTypePage extends StatefulWidget {
  const PassengerPackageTypePage({super.key});

  @override
  State<PassengerPackageTypePage> createState() => _PassengerPackageTypePageState();
}

class _PassengerPackageTypePageState extends State<PassengerPackageTypePage> {
  RadialOption? currentRadialOption;
  VoidCallback? nextStepCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerNextFloatingButton(onPressed: nextStepCallback),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          PassengerSliverAppBarWidget(
            onLeadingPreassed: navigateBackToPathSelection,
            leadingIcon: Icons.arrow_back,
            titleText: "Viajante",
            bottom: const PassengerAppBarBottomWidget(
              text: "O volume que você pode deslocar tem tamanho similar a que?",
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: const PassengerSubtitleTextWidget("Tamanhos"),
            ),
          ),
          PassengerRadialListWidget(
            objectList: PassengerRadialOptions.availablePackageList,
            groupValue: currentRadialOption,
            onChanged: onRadialOptionUpdated,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 64)),
        ],
      ),
    );
  }

  void onRadialOptionUpdated(RadialOption? value) {
    setState(() {
      currentRadialOption = value;
      nextStepCallback = navigateToPackageWeightSelection;
    });
  }

  void navigateToPackageWeightSelection() {}

  void navigateBackToPathSelection() {
    Navigator.of(context).pop();
  }
}
