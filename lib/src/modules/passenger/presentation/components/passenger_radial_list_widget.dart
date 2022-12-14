import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/radial_option_model.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class PassengerRadialListWidget extends StatelessWidget {
  final RadialOptionModel? groupValue;
  final List<RadialOptionModel> objectList;
  final Function(RadialOptionModel?) onChanged;

  const PassengerRadialListWidget({
    required this.objectList,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _buildSliverList,
        childCount: objectList.length,
      ),
    );
  }

  RadioListTile _buildSliverList(BuildContext context, int index) {
    const titleStyle = TextStyle(
      fontSize: 14,
      color: AppConstants.darkColor,
    );

    const subtitleStyle = TextStyle(
      fontSize: 12,
      color: AppConstants.subtitleColor,
    );

    final radialOption = objectList[index];

    final subtitleWidget = radialOption.description != null
        ? Text(radialOption.description!, style: subtitleStyle)
        : null;

    return RadioListTile<RadialOptionModel>(
      value: radialOption,
      groupValue: groupValue,
      title: Text(radialOption.name, style: titleStyle),
      subtitle: subtitleWidget,
      secondary: Image.asset("assets/icons/${radialOption.asset}"),
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: const Color(0xFF24B96E),
    );
  }
}
