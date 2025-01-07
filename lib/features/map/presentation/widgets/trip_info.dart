import 'package:flutter/material.dart';

import '../../domain/entities/distance.dart';

class TripInfo extends StatelessWidget {
  final Distance? distance;

  const TripInfo({
    super.key,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return distance == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Wrap(
              children: [
                Text("Time: "),
                Text(distance!.duration.toString()),
                SizedBox(width: 20),
                Text("Distance: "),
                Text(distance!.distance.toString()),
              ],
            ),
          );
  }
}
