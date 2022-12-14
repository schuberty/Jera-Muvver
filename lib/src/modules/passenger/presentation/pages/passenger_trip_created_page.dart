import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_floating_button.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';
import 'package:jera_muvver/src/shared/extensions.dart';

class PassengerTripCreatedPage extends StatefulWidget {
  const PassengerTripCreatedPage({super.key});

  @override
  State<PassengerTripCreatedPage> createState() => _PassengerTripCreatedPageState();
}

class _PassengerTripCreatedPageState extends State<PassengerTripCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PassengerFloatingButton(
        "Voltar ao início",
        onPressed: nextStepCallback,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/send_paper.png"),
              const Text(
                "Viagem criada",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 17),
              const Text(
                "Vamos ver os volumes já disponíveis para a sua viagem.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 29),
              const Text(
                "Ao prosseguir, você declara para efeitos legais, administrativos, jurídicos e demais aplicáveis, a veracidade de todas as informações prestadas antes, durante e após qualquer uma das etapas do app.",
                style: TextStyle(color: AppConstants.subtitleColor, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextStepCallback() {
    Navigator.of(context).pushNamedAndRemoveAll("/");
  }
}
