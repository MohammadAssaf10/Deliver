import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/custom_app_image.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/profile.dart';
import 'profile_tile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (profile.profileImage == null)
          Container(
            width: 85,
            height: 85,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorsManager.lightGrey,
              ),
            ),
            child: Icon(
              Icons.person,
              size: 60,
              color: ColorsManager.lightGrey,
            ),
          ),
        if (profile.profileImage != null)
          Container(
            height: 85,
            width: 85,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CustomAppImage(
              image: profile.profileImage!,
              height: 85,
              width: 85,
              boxShape: BoxShape.circle,
              borderRadius: null,
            ),
          ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              ProfileTile(
                title: S.of(context).clientId,
                subTitle: profile.userId.toString(),
              ),
              ProfileTile(
                title: S.of(context).name,
                subTitle: profile.name,
              ),
              ProfileTile(
                title: S.of(context).phone,
                subTitle: profile.phone,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
