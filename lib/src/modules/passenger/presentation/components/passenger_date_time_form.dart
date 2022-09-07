import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PassengerDateTimeForm extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback? afterDatePicked;
  final String? labelText;
  final String? selectDateText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool? isEnabled;

  const PassengerDateTimeForm({
    required this.textController,
    this.afterDatePicked,
    this.labelText,
    this.selectDateText,
    this.firstDate,
    this.lastDate,
    this.isEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: textController,
      enabled: isEnabled,
      onTap: () => _onTapFormField(context),
      style: const TextStyle(
        fontSize: 15,
        color: Color(0xFF222222),
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Color(0XFF222222),
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF222222),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  void _onTapFormField(BuildContext context) async {
    final initialDate = firstDate ?? DateTime.fromMicrosecondsSinceEpoch(0);
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate,
      lastDate: lastDate ?? DateTime(2100),
      confirmText: "Ok",
      cancelText: "Cancel",
      helpText: selectDateText,
      builder: _buildDatePicker,
    );

    if (date != null) {
      final formattedDate = DateFormat("dd/MM/yyyy").format(date);
      textController.text = formattedDate;
    }

    if (afterDatePicked != null) {
      afterDatePicked!();
    }
  }

  Widget _buildDatePicker(BuildContext context, Widget? child) {
    if (child == null) {
      return const SizedBox.shrink();
    }

    final theme = ThemeData.light();

    return Theme(
      data: theme.copyWith(
        primaryColor: const Color(0xFF16A45C),
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xFF16A45C),
          secondary: Colors.red,
          surface: Colors.red,
          shadow: Colors.red,
          background: Colors.red,
        ),
      ),
      child: child,
    );
  }
}
