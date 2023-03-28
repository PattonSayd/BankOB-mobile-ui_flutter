import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';

class DottedBox extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? dottedButtonSize;
  final double? borderRadius;
  final VoidCallback onPress;

  const DottedBox({
    Key? key,
    required this.title,
    this.subtitle,
    this.dottedButtonSize = 48,
    this.borderRadius = 16,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [0, 4, 6, 0],
      strokeWidth: 1.2,
      color: AppColors.instance.borderActiveColor,
      borderType: BorderType.RRect,
      radius: Radius.circular(borderRadius!),
      padding: context.paddingAll16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.kDottedBoxTitleStyle,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  subtitle!,
                  style: AppTextStyles.kDottedBoxSubtitleStyle,
                ),
              ]
            ],
          ),
          GestureDetector(
            onTap: onPress,
            child: SvgPicture.asset(
              AppAssets.addButton,
              width: dottedButtonSize,
            ),
          ),
        ],
      ),
    );
  }
}
