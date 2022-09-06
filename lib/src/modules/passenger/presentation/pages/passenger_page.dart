import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jera_muvver/src/modules/passenger/domain/enums/transport_type_enum.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  TransportType currentTransportType = TransportType.car;

  @override
  Widget build(BuildContext context) {
    const transportTypeList = TransportType.values;

    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            backgroundColor: const Color(0xFF16A45C),
          ),
          child: const Text(
            "Avançar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leading: IconButton(
              onPressed: () => _navigateBackToHomePage(context),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Viajante",
              style: TextStyle(
                color: Colors.white.withOpacity(0.54),
                fontSize: 16,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(gradient: AppConstants.linearGradientBlackToGrey()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(gradient: AppConstants.linearGradientBlackToGrey()),
              child: const Text(
                "Qual será o meio de transporte da sua viagem?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: const Text(
                "Transporte",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final transport = transportTypeList[index];
              return RadioListTile<TransportType>(
                value: transport,
                groupValue: currentTransportType,
                title: Text(transport.transportName),
                secondary: Image.asset("assets/icons/${transport.iconAsset}"),
                onChanged: (value) => setState(() => currentTransportType = value!),
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: Colors.green,
              );
            }, childCount: transportTypeList.length),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 64)),
        ],
      ),
    );
  }

  void _navigateBackToHomePage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
