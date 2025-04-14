
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/app_extensions.dart';
import '../../generated/l10n.dart';
import '../theming/colors_manager.dart';
import '../theming/text_styles.dart';
import '../widget/app_text_button.dart';

Future<void> showImageSourceDialog(BuildContext context,
    void Function(ImageSource imageSource) onPress) async {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: ColorsManager.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).selectImageSource,
              style: TextStyles.font20DarkGreyBold,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      onPress(ImageSource.camera);
                      context.pop();
                    },
                    buttonHeight: 45,
                    child: Text(
                      S.of(context).camera,
                      style: TextStyles.font14WhiteRegular,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      onPress(ImageSource.gallery);
                      context.pop();
                    },
                    buttonHeight: 45,
                    child: Text(
                      S.of(context).gallery,
                      style: TextStyles.font14WhiteRegular,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}