import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/address.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/map_bloc.dart';

class ToFromCard extends StatelessWidget {
  final String title;
  final Address? address;
  final bool isStartPoint;

  const ToFromCard({
    super.key,
    required this.title,
    required this.isStartPoint,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 45,
          child: Text(
            title,
            style: TextStyles.font16DarkGreyBold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorsManager.customWhite,
              border: Border.all(
                color: ColorsManager.darkGrey,
                width: 1.5,
              ),
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    address?.administrativeArea == null
                        ? address != null
                            ? "${address!.longitude}, ${address!.latitude}"
                            : isStartPoint
                                ? S.of(context).pickupLocation
                                : S.of(context).whereAreYouGoing
                        : '${address?.administrativeArea}, ${address?.locality}, ${address?.street}',
                    style: TextStyles.font15BlackRegular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (isStartPoint) {
                      context.read<MapBloc>().setHintMessage(
                          S.of(context).pleaseSelectStartTripLocation);
                      context.read<MapBloc>().setIsStartAddress(true);
                    } else {
                      context.read<MapBloc>().setHintMessage(
                          S.of(context).pleaseSelectEndTripLocation);
                      context.read<MapBloc>().setIsStartAddress(false);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.white,
                    child: Icon(
                      Icons.edit,
                      color: ColorsManager.darkGrey,
                    ),
                  ),
                ),
                if (isStartPoint)
                  GestureDetector(
                    onTap: () {
                      context.read<MapBloc>().getCurrentLocation();
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorsManager.white,
                      child: Icon(
                        Icons.my_location,
                        color: ColorsManager.darkGrey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
