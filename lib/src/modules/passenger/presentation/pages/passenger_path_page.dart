import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_cancel_text_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_path_tab_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/tab_bars/passengern_path_map_tab.dart';
import 'package:jera_muvver/src/shared/extensions.dart';

import 'tab_bars/passenger_path_tab.dart';

class PassengerPathPage extends StatefulWidget {
  const PassengerPathPage({super.key});

  @override
  State<PassengerPathPage> createState() => _PassengerPathPageState();
}

class _PassengerPathPageState extends State<PassengerPathPage> with TickerProviderStateMixin {
  late final TabController tabController;

  VoidCallback? nextStepCallback;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(unfocusKeyboardOnTabChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerFloatingButton("Avançar", onPressed: nextStepCallback),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PassengerAppBarWidget(
        onLeadingPreassed: navigateBackToTransportSelection,
        titleText: "Viajante",
        actions: <Widget>[
          PassengerCancelTextButton(onPressed: navigateBackToHome),
        ],
        bottom: PassengerAppBarBottomWidget(
          height: 94,
          text: "Qual o trajeto da sua viagem?",
          tabBarWidget: PassengerPathTabBarWidget(tabController: tabController),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            PassengerPathTab(enableNextStep: updateNextStep),
            const PassengerPathMapTab(),
          ],
        ),
      ),
    );
  }

  void updateNextStep(bool enable) {
    if (enable) {
      setState(() => nextStepCallback = navigateToPackageSize);
    } else {
      setState(() => nextStepCallback = null);
    }
  }

  void navigateToPackageSize() {
    Navigator.of(context).pushNamed("/passenger/package/type");
  }

  void navigateBackToTransportSelection() {
    Navigator.of(context).pop();
  }

  void navigateBackToHome() {
    Navigator.of(context).pushNamedAndRemoveAll("/");
  }

  void unfocusKeyboardOnTabChange() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
