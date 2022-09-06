import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_cancel_text_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_path_tab_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';

class PassengerPathPage extends StatefulWidget {
  const PassengerPathPage({super.key});

  @override
  State<PassengerPathPage> createState() => _PassengerPathPageState();
}

class _PassengerPathPageState extends State<PassengerPathPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerNextFloatingButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          PassengerSliverAppBarWidget(
            onLeadingPreassed: _navigateBackToTransportSelection,
            titleText: "Viajante",
            actions: <Widget>[
              PassengerCancelTextButton(onPressed: _navigateBackToHome),
            ],
            bottom: PassengerAppBarBottomWidget(
              height: 100,
              text: "Qual o trajeto da sua viagem?",
              tabBarWidget: PassengerPathTabBarWidget(tabController: _tabController),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateBackToTransportSelection() {
    Navigator.of(context).pop();
  }

  void _navigateBackToHome() {
    Navigator.of(context).pushNamedAndRemoveUntil("/", (_) => false);
  }
}
