import 'package:flutter/material.dart';

import '../widgets/deliver_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DeliverMap(),
    );
  }
}
