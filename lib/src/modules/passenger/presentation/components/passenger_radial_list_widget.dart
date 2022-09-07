import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/model/radial_option.dart';

class PassengerRadialListWidget extends StatelessWidget {
  final RadialOptionBase? groupValue;
  final List<RadialOptionBase> objectList;
  final Function(RadialOptionBase?) onChanged;

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
      color: Color(0xFF222222),
    );

    const subtitleStyle = TextStyle(
      fontSize: 12,
      color: Color(0x22222252),
    );

    final radialOption = objectList[index];

    final subtitleWidget = radialOption.description != null
        ? Text(radialOption.description!, style: subtitleStyle)
        : null;

    return RadioListTile<RadialOptionBase>(
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
