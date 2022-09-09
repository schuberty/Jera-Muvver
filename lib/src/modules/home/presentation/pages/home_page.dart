import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/home/presentation/components/home_header_widget.dart';
import 'package:jera_muvver/src/modules/home/presentation/components/icon_profile_button.dart';
import 'package:jera_muvver/src/modules/home/presentation/components/icon_text_button.dart';
import 'package:jera_muvver/src/modules/home/presentation/components/shaded_home_card.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';
import 'package:jera_muvver/src/shared/services/inform_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        actions: <Widget>[
          IconProfileButton(
            onPressed: _showNotImplementedSnackBar,
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const HomeHeaderWidget(),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "Entregue ou envie.",
                style: TextStyle(color: AppConstants.subtitleColor, fontSize: 20),
              ),
              SizedBox(height: screenHeight * 0.05),
              ShadedHomeCard(
                onPressed: _showNotImplementedSnackBar,
                title: "Remetente",
                subtitle: "Pra onde quer enviar seu objeto?",
                assetName: "assets/images/box.png",
              ),
              SizedBox(height: screenHeight * 0.03),
              ShadedHomeCard(
                onPressed: () => _navigateToPassengerPage(context),
                title: "Viajante",
                subtitle: "Vai viajar para onde?",
                assetName: "assets/images/delivery-truck.png",
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 56,
          child: Row(
            children: <Widget>[
              IconTextButton(
                onPressed: () {},
                icon: Icons.home,
                bellowText: "Início",
              ),
              IconTextButton(
                onPressed: _showNotImplementedSnackBar,
                icon: Icons.notifications,
                bellowText: "Notificações",
              ),
              IconTextButton(
                onPressed: _showNotImplementedSnackBar,
                icon: Icons.chat_bubble,
                bellowText: "Chat",
              ),
              IconTextButton(
                onPressed: _showNotImplementedSnackBar,
                icon: Icons.layers,
                bellowText: "Pedidos",
              ),
              IconTextButton(
                onPressed: _showNotImplementedSnackBar,
                icon: Icons.local_shipping,
                bellowText: "Entregas",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPassengerPage(BuildContext context) {
    Navigator.of(context).pushNamed("/passenger");
  }

  void _showNotImplementedSnackBar() {
    InformService.showNotImplementedSnackBar();
  }
}
