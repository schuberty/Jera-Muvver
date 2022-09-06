import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/enums/transport_type_enum.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_transport_radial_list_widget.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  TransportType? currentTransportType;
  VoidCallback? nextStepOnPressed;

  @override
  Widget build(BuildContext context) {
    const transportTypeList = TransportType.values;

    return Scaffold(
      floatingActionButton: PassengerNextFloatingButton(onPressed: nextStepOnPressed),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          PassengerSliverAppBarWidget(
            onLeadingPreassed: _navigateBackToHomePage,
            leadingIcon: Icons.close,
            titleText: "Viajante",
            bottom: const PassengerAppBarBottomWidget(
              height: 80,
              text: "Qual será o meio de transporte da sua viagem?",
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: const PassengerSubtitleTextWidget("Transporte"),
            ),
          ),
          PassengerTransportRadialListWidget(
            transportList: transportTypeList,
            groupValue: currentTransportType,
            onChanged: _updateTransportTypeSelected,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 64)),
        ],
      ),
    );
  }

  void _updateTransportTypeSelected(TransportType? value) {
    setState(() {
      currentTransportType = value;
      nextStepOnPressed = _navigateToPassengerPathSelection;
    });
  }

  void _navigateToPassengerPathSelection() {
    Navigator.of(context).pushNamed("/passenger/path");
  }

  void _navigateBackToHomePage() {
    Navigator.of(context).pop();
  }
}
