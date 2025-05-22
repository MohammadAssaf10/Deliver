import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/address.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
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
            style: const TextStyle(
              fontSize: 16,
              color: ColorsManager.darkGrey,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
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
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: CustomAutoSizeText(text:
                    address?.administrativeArea == null
                        ? address != null
                            ? "${address!.longitude}, ${address!.latitude}"
                            : isStartPoint
                                ? S.of(context).pickupLocation
                                : S.of(context).whereAreYouGoing
                        : '${address?.administrativeArea}, ${address?.locality}, ${address?.street}',
                    minFontSize: 13,
                    initialFontSize: 15,
                    maxFontSize: 17,
                    color: ColorsManager.darkGrey,
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
                  child: const CircleAvatar(
                    backgroundColor: ColorsManager.white,
                    child: Icon(
                      Icons.edit_location,
                      color: ColorsManager.darkGrey,
                    ),
                  ),
                ),
                if (isStartPoint) ...[
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      context.read<MapBloc>().getCurrentLocation();
                    },
                    child: const CircleAvatar(
                      backgroundColor: ColorsManager.white,
                      child: Icon(
                        Icons.my_location,
                        color: ColorsManager.darkGrey,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        )
      ],
    );
  }
}
