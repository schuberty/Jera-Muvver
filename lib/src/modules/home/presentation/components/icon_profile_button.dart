import 'package:flutter/material.dart';

class IconProfileButton extends StatelessWidget {
  final Widget child;

  const IconProfileButton({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              color: Color(0x22222229),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: child,
      ),
    );
  }
}