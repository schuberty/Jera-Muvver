import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String bellowText;

  const IconTextButton({required this.icon, required this.bellowText, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: AppConstants.secondaryColor, size: 22),
            const SizedBox(height: 1),
            Text(
              bellowText,
              style: const TextStyle(color: AppConstants.secondaryColor, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
