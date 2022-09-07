import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/data/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_radial_list_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/radial_options.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
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
            onLeadingPreassed: navigateBackToHomePage,
            leadingIcon: Icons.close,
            titleText: "Viajante",
            bottom: const PassengerAppBarBottomWidget(
              text: "Qual será o meio de transporte da sua viagem?",
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: const PassengerSubtitleTextWidget("Transporte"),
            ),
          ),
          PassengerRadialListWidget(
            objectList: PassengerRadialOptions.availableTransportList,
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
