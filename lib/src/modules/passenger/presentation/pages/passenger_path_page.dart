import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_cancel_text_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_path_tab_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';

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
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: const PassengerNextFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PassengerAppBarWidget(
        onLeadingPreassed: _navigateBackToTransportSelection,
        titleText: "Viajante",
        actions: <Widget>[
          PassengerCancelTextButton(onPressed: _navigateBackToHome),
        ],
        bottom: PassengerAppBarBottomWidget(
          height: 94,
          text: "Qual o trajeto da sua viagem?",
          tabBarWidget: PassengerPathTabBarWidget(tabController: _tabController),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: const PassengerSubtitleTextWidget(
                    "Selecione a data e rota da sua viagem",
                  ),
                )
              ],
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
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
