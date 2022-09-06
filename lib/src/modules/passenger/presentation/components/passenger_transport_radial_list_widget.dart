import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/domain/enums/transport_type_enum.dart';

class PassengerTransportRadialListWidget extends StatelessWidget {
  final List<TransportType> transportList;
  final TransportType? groupValue;
  final Function(TransportType?) onChanged;

  const PassengerTransportRadialListWidget({
    required this.transportList,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final transport = transportList[index];

        return RadioListTile<TransportType>(
          value: transport,
          groupValue: groupValue,
          title: Text(transport.transportName),
          secondary: Image.asset("assets/icons/${transport.iconAsset}"),
          onChanged: onChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: const Color(0xFF24B96E),
        );
      }, childCount: transportList.length),
    );
  }
}
