import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';

class TripTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int subtitleMaxLine;
  final IconData? icon;

  final String? pngIcon;

  const TripTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleMaxLine = 1,
    this.icon,
    this.pngIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 20,
              color: ColorsManager.darkGrey.withValues(alpha: 0.8),
            ),
          if (pngIcon != null)
            Image.asset(
              pngIcon!,
              height: 20,
              width: 20,
            ),
          const SizedBox(width: 6),
          Text(
            "$title: ",
            style: const TextStyle(
              fontSize: 16,
              color: ColorsManager.darkGrey,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: ColorsManager.darkGrey,
              ),
              maxLines: subtitleMaxLine,
            ),
          ),
        ],
      ),
    );
  }
}
