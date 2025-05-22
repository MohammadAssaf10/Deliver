import 'package:flutter/material.dart';

import 'lets_roll_card.dart';
import 'pickup_point_card.dart';

class UserDoNotHaveTripWidget extends StatelessWidget {
  const UserDoNotHaveTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickupPointCard(),
        LetsRollCard(),
      ],
    );
  }
}
