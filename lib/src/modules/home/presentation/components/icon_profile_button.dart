import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class IconProfileButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const IconProfileButton({required this.child, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        width: 32,
        margin: const EdgeInsets.fromLTRB(0, 16, 16, 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.75),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0, 3),
              color: AppConstants.darkColor,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: child,
      ),
    );
  }
}
