import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String subTitle;

  const ProfileTile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font14LightGreyBold,
        ),
        Text(
          subTitle,
          style: TextStyles.font14LightGreyRegular,
        ),
      ],
    );
  }
}
