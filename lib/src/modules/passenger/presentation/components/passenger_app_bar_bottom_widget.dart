import 'package:flutter/material.dart';

class PassengerAppBarBottomWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double height;
  final Widget? tabBarWidget;

  const PassengerAppBarBottomWidget({
    required this.text,
    this.height = 80,
    this.tabBarWidget,
    super.key,
  });

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
