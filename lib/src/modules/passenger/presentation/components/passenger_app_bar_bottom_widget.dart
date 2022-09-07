import 'package:flutter/material.dart';

class PassengerAppBarBottomWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double height;
  final Widget? tabBarWidget;

  const PassengerAppBarBottomWidget({
    required this.text,
    double? height,
    this.tabBarWidget,
    super.key,
  }) : height = height ?? 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          width: double.infinity,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        tabBarWidget ?? const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
