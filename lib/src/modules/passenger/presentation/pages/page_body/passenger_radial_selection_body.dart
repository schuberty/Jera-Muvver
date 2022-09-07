import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_app_bar_bottom_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_next_floating_button.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_radial_list_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_sliver_app_bar_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';

class PassengerRadialSelectionBody extends StatelessWidget {
  final List<RadialOptionModel> radialList;
  final RadialOptionModel? radialGroup;
  final VoidCallback? nextStepCallback;
  final VoidCallback onBackLeadingPressed;
  final Function(RadialOptionModel?) onRadialOptionUpdated;
  final String pageTitle;
  final String pageSubtitle;
  final String radialListTitle;
  final double? appBarHeight;

  const PassengerRadialSelectionBody({
    required this.radialList,
    required this.radialGroup,
    required this.nextStepCallback,
    required this.onBackLeadingPressed,
    required this.onRadialOptionUpdated,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.radialListTitle,
    this.appBarHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerNextFloatingButton(onPressed: nextStepCallback),
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
