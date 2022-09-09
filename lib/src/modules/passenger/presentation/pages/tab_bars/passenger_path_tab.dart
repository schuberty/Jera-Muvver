import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_date_time_form.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_text_form.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/transport_data_model.dart';
import 'package:jera_muvver/src/shared/utils.dart';
import 'package:provider/provider.dart';

class PassengerPathTab extends StatefulWidget {
  final Function(bool) enableNextStep;

  const PassengerPathTab({required this.enableNextStep, super.key});

  @override
  State<PassengerPathTab> createState() => _PassengerPathTabState();
}

class _PassengerPathTabState extends State<PassengerPathTab> with AutomaticKeepAliveClientMixin {
  late final TextEditingController departureDateController;
  late final TextEditingController arrivalDateController;
  late final TextEditingController originCityController;
  late final TextEditingController destinationCityController;

  late bool canChangeArrivalDateTime;
  late DateTime arrivalFirstDateTime;

  @override
  void initState() {
    super.initState();

    departureDateController = TextEditingController();
    arrivalDateController = TextEditingController();
    originCityController = TextEditingController();
    destinationCityController = TextEditingController();

    canChangeArrivalDateTime = false;
    arrivalFirstDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: const PassengerSubtitleTextWidget(
              "Selecione a data e rota da sua viagem",
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: PassengerDateTimeForm(
                    textController: departureDateController,
                    labelText: "Data de partida",
                    selectDateText: "Selecionar data de partida",
                    firstDate: DateTime.now(),
                    afterDatePicked: checkDateForm,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                  child: PassengerDateTimeForm(
                    textController: arrivalDateController,
                    labelText: "Data de chegada",
                    selectDateText: "Selecionar data de chegada",
                    firstDate: arrivalFirstDateTime,
                    afterDatePicked: checkDateForm,
                    isEnabled: canChangeArrivalDateTime,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: PassengerTextForm(
              controller: originCityController,
              textInputAction: TextInputAction.next,
              onChanged: checkCityForm,
              labelText: "Cidade de origem",
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: PassengerTextForm(
              controller: destinationCityController,
              textInputAction: TextInputAction.done,
              onChanged: checkCityForm,
              labelText: "Cidade de destino",
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  void checkDateForm() {
    if (departureDateController.text.isNotEmpty) {
      final departureDate = parseDate(departureDateController.text);

      if (arrivalDateController.text.isNotEmpty) {
        final arrivalDate = parseDate(arrivalDateController.text);

        if (departureDate.isAfter(arrivalDate)) {
          arrivalDateController.clear();
        }
      }

      setState(() {
        arrivalFirstDateTime = departureDate;
        canChangeArrivalDateTime = true;
      });
    } else {
      setState(() => canChangeArrivalDateTime = false);
    }

    updateNextButton();
  }

  void checkCityForm(String value) {
    updateNextButton();
  }

  void updateNextButton() {
    DateTime? departureDate;
    DateTime? arrivalDate;
    String? originCity;
    String? destinationCity;

    if (departureDateController.text.isNotEmpty) {
      departureDate = parseDate(departureDateController.text);
    }

    if (arrivalDateController.text.isNotEmpty) {
      arrivalDate = parseDate(arrivalDateController.text);
    }

    if (originCityController.text.isNotEmpty) {
      originCity = originCityController.text;
    }

    if (destinationCityController.text.isNotEmpty) {
      destinationCity = destinationCityController.text;
    }

    if (departureDate != null &&
        arrivalDate != null &&
        originCity != null &&
        destinationCity != null) {
      final transportDates = TransportDataModel(
        departureDate: departureDate,
        arrivalDate: arrivalDate,
        originCity: originCity,
        destinationCity: destinationCity,
      );

      context.read<PassengerCubit>().updateTransportDate = transportDates;

      widget.enableNextStep(true);
    } else {
      widget.enableNextStep(false);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    departureDateController.dispose();
    arrivalDateController.dispose();
    originCityController.dispose();
    destinationCityController.dispose();

    super.dispose();
  }
}
