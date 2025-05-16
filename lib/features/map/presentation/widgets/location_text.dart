import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../bloc/map_bloc.dart';

class LocationText extends StatelessWidget {
  final String message;

  const LocationText({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<MapBloc>().panelController.open();
              context.read<MapBloc>().changeIsPanelOpenState(true);
              context.read<MapBloc>().setHintMessage("");
            },
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: ColorsManager.darkWhite,
              child: Icon(
                Icons.close,
                color: ColorsManager.darkGrey,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
