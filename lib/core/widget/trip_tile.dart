import 'package:flutter/material.dart';

import '../theming/styles_manager.dart';

class TripTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const TripTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: TextStyles.font16DarkGreyBold,
          ),
          Text(
            subtitle,
            style: TextStyles.font16DarkGreyRegular,
          ),
        ],
      ),
    );
  }
}
