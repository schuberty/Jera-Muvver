import 'package:flutter/material.dart';

class PassengerPathTabBarWidget extends StatelessWidget {
  final TabController tabController;

  const PassengerPathTabBarWidget({
    required this.tabController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const <Widget>[
        Tab(
          child: Text(
            "Rotas",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Mapas",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}
