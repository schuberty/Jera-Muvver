import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';
import 'package:jera_muvver/src/shared/utils.dart';

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
        color: AppConstants.darkColor,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: AppConstants.darkColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppConstants.darkColor,
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
      final formattedDate = formatDate(date);
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
        primaryColor: AppConstants.primaryColor,
        colorScheme: theme.colorScheme.copyWith(
          primary: AppConstants.primaryColor,
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
