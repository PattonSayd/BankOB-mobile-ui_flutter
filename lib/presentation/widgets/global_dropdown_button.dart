import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/constants/app_assets.dart';
import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';

class GlobalDropDownButton extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final List dropdownItems;
  final bool isEnabled;
  final bool isDeactive;
  final VoidCallback? onTap;

  const GlobalDropDownButton({
    Key? key,
    this.labelText,
    this.hintText,
    required this.dropdownItems,
    this.isEnabled = true,
    this.isDeactive = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<GlobalDropDownButton> createState() => _GlobalDropDownButtonState();
}

class _GlobalDropDownButtonState extends State<GlobalDropDownButton> {
  dynamic selected;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 7.37.h,
        decoration: BoxDecoration(
          color: widget.isEnabled
              ? AppColors.instance.inputColor
              : AppColors.instance.borderInactiveColor,
          borderRadius: context.borderRadiusAll8,
          border: Border.all(
            color: AppColors.instance.borderInactiveColor,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: AbsorbPointer(
                absorbing: true,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    labelText: widget.labelText,
                    floatingLabelStyle: AppTextStyles.kFloatingLabelStyle,
                    contentPadding: context.contentPadding,
                  ),
                  value: selected == null
                      ? selected
                      : widget.dropdownItems[0], //remark
                  // hint: widget.hintText != null
                  //     ? Text(
                  //         widget.hintText!,
                  //         style: AppTextStyles.kLabelTextStyle,
                  //       )
                  //     : Text(
                  //         widget.dropdownItems[0],
                  //         style: AppTextStyles.kInputTextStyle,
                  //       ),
                  isDense: false,
                  // isExpanded: true,
                  // autofocus: true,
                  disabledHint: Text(
                    widget.hintText ?? '',
                    style: AppTextStyles.kLabelTextStyle,
                  ),
                  itemHeight: 10.h,
                  iconSize: 0,
                  items: widget.dropdownItems
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: selected = e,
                                child: Text(e),
                              ))
                      .toList(),
                  onChanged: widget.isEnabled && !widget.isDeactive
                      ? (value) {}
                      : null,
                ),
              ),
            ),
            Positioned(
              top: (7.37.h / 2) - (8 / 2),
              right: 20,
              child: SvgPicture.asset(AppAssets.arrowDown),
            ),
          ],
        ),
      ),
    );
  }
}
