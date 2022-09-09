import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_radial_list_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';

class PassengerRadialSelectionBody extends StatelessWidget {
  final List<RadialOptionModel> radialList;
  final RadialOptionModel? radialGroup;
  final VoidCallback? nextStepCallback;
  final VoidCallback onBackLeadingPressed;
  final Function(RadialOptionModel?) onRadialOptionUpdated;
  final String pageTitle;
  final String pageSubtitle;
  final String radialListTitle;
  final String nextButtonText;
  final double? appBarHeight;
  final List<Widget>? actions;

  const PassengerRadialSelectionBody({
    required this.radialList,
    required this.radialGroup,
    required this.nextStepCallback,
    required this.onBackLeadingPressed,
    required this.onRadialOptionUpdated,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.radialListTitle,
    this.nextButtonText = "Avançar",
    this.appBarHeight,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerFloatingButton(nextButtonText, onPressed: nextStepCallback),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          PassengerSliverAppBarWidget(
            onLeadingPreassed: onBackLeadingPressed,
            leadingIcon: Icons.arrow_back,
            titleText: pageTitle,
            bottom: PassengerAppBarBottomWidget(
              text: pageSubtitle,
              height: appBarHeight,
            ),
            actions: actions,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: PassengerSubtitleTextWidget(radialListTitle),
            ),
          ),
          PassengerRadialListWidget(
            objectList: radialList,
            groupValue: radialGroup,
            onChanged: onRadialOptionUpdated,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 64)),
        ],
      ),
    );
  }
}
