import 'package:flutter/material.dart';

class ShadedHomeCard extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String title;
  final String subtitle;
  final String assetName;

  const ShadedHomeCard({
    required this.height,
    required this.title,
    required this.subtitle,
    required this.assetName,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF353740), Color(0xFF222222)],
            transform: GradientRotation(-0.1),
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(58, 24, 0, 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 42,
                    margin: const EdgeInsets.fromLTRB(24, 4, 0, 24),
                    width: cardWidth * 0.5,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(assetName),
            )
          ],
        ),
      ),
    );
  }
}
