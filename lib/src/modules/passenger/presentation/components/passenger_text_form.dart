import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class PassengerTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? labelText;
  final Function(String)? onChanged;

  const PassengerTextForm({
    this.controller,
    this.textInputAction,
    this.labelText,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: AppConstants.darkColor,
          size: 22,
        ),
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
}
