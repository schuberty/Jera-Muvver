import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_date_time_form.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/components/passenger_subtitle_text_widget.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/cubit/passenger_cubit.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/model/package_dates_model.dart';
import 'package:jera_muvver/src/shared/utils.dart';
import 'package:provider/provider.dart';

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
    DateTime? departureDate;
    DateTime? arrivalDate;

    if (departureDateController.text.isNotEmpty) {
      departureDate = parseDate(departureDateController.text);

      if (arrivalDateController.text.isNotEmpty) {
        arrivalDate = parseDate(arrivalDateController.text);

        if (departureDate.isAfter(arrivalDate)) {
          arrivalDateController.clear();
        }
      }

      setState(() {
        arrivalFirstDateTime = departureDate!;
        canChangeArrivalDateTime = true;
      });
    } else {
      setState(() => canChangeArrivalDateTime = false);
    }

    if (departureDate != null && arrivalDate != null) {
      final transportDates = TransportDateModel(
        departureDate: departureDate,
        arrivalDate: arrivalDate,
      );

      context.read<PassengerCubit>().updateTransportDate = transportDates;

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
