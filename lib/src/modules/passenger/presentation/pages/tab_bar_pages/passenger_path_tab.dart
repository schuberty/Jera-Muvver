import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_date_time_form.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';

class PassengerPathTab extends StatefulWidget {
  final VoidCallback enableNextStep;

  const PassengerPathTab({required this.enableNextStep, super.key});

  @override
  State<PassengerPathTab> createState() => _PassengerPathTabState();
}

class _PassengerPathTabState extends State<PassengerPathTab> with AutomaticKeepAliveClientMixin {
  late final TextEditingController departureDateController;
  late final TextEditingController arrivalDateController;

  late bool canChangeArrivalDateTime;
  late DateTime arrivalFirstDateTime;

  @override
  void initState() {
    super.initState();

    departureDateController = TextEditingController();
    arrivalDateController = TextEditingController();

    canChangeArrivalDateTime = false;
    arrivalFirstDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
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
                  afterDatePicked: updateDateInput,
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
                  afterDatePicked: updateDateInput,
                  isEnabled: canChangeArrivalDateTime,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void updateDateInput() {
    if (departureDateController.text.isNotEmpty) {
      final departureDateTime = DateFormat("dd/MM/yyyy").parse(departureDateController.text);
      departureDateTime.add(const Duration(microseconds: 1));

      if (arrivalDateController.text.isNotEmpty) {
        final arrivalDateTime = DateFormat("dd/MM/yyyy").parse(arrivalDateController.text);

        if (departureDateTime.isAfter(arrivalDateTime)) {
          arrivalDateController.clear();
        }
      }

      setState(() {
        arrivalFirstDateTime = departureDateTime;
        canChangeArrivalDateTime = true;
      });
    } else {
      setState(() => canChangeArrivalDateTime = false);
    }

    if (departureDateController.text.isNotEmpty && arrivalDateController.text.isNotEmpty) {
      widget.enableNextStep();
    }
  }

  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    departureDateController.dispose();
    arrivalDateController.dispose();
    super.dispose();
  }
}
