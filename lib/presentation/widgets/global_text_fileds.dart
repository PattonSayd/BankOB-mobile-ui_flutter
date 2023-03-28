import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/constants/app_assets.dart';
import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalTextField extends StatefulWidget {
  final TextEditingController inputController;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final String? labelText;
  final String? iconData;
  final FocusNode inputFocus;
  final bool obscureText;
  final bool isEnabled;
  final bool successSuffixIcon;
  final bool progressSuffixIcon;
  final bool isValidate;
  final bool isDefault;
  final String? isHint;

  const GlobalTextField({
    Key? key,
    required this.inputController,
    this.onChanged,
    this.onValidate,
    this.labelText,
    required this.inputFocus,
    this.iconData,
    this.obscureText = false,
    this.isEnabled = true,
    this.successSuffixIcon = false,
    this.progressSuffixIcon = false,
    this.isValidate = false,
    this.isDefault = false,
    this.isHint,
  }) : super(key: key);

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isVisible = false;
  bool _isActive = false;
  late AppLocalizations appLocalizations;

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void listenFocus() {
    setState(() {
      if (widget.inputFocus.hasFocus) {
        _isActive = true;
      } else {
        _isActive = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.inputFocus.addListener(listenFocus);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    widget.inputFocus.removeListener(listenFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.isDefault ? null : 7.37.h,
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? AppColors.instance.inputColor
                : AppColors.instance.borderInactiveColor,
            borderRadius: context.borderRadiusAll8,
            border: Border.all(
              color: _isActive
                  ? AppColors.instance.borderActiveColor
                  : widget.isValidate
                      ? AppColors.instance.borderErrorColor
                      : AppColors.instance.borderInactiveColor,
            ),
          ),
          child: Center(
            child: TextFormField(
              controller: widget.inputController,
              focusNode: widget.inputFocus,
              onChanged: widget.onChanged,
              validator: widget.onValidate,
              enabled: widget.isEnabled,
              obscureText: _isVisible ? false : widget.obscureText,
              style: widget.isEnabled
                  ? AppTextStyles.kInputTextStyle
                  : AppTextStyles.kLabelTextStyle,
              decoration: InputDecoration(
                hintText: widget.isHint,
                hintStyle: TextStyle(color: AppColors.instance.textLabelColor),
                fillColor: Colors.transparent,
                filled: true,
                labelText: widget.labelText,
                floatingLabelStyle: AppTextStyles.kFloatingLabelStyle,
                labelStyle: AppTextStyles.kLabelTextStyle,
                contentPadding: context.contentPadding,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        splashRadius: 0.1,
                        icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.instance.primaryColor,
                        ),
                        onPressed: changeVisibility,
                      )
                    : widget.successSuffixIcon
                        ? SvgPicture.asset(
                            AppAssets.successIcon,
                            fit: BoxFit.scaleDown,
                          )
                        : widget.progressSuffixIcon
                            ? SvgPicture.asset(
                                AppAssets.progressIcon,
                                fit: BoxFit.scaleDown,
                              )
                            : widget.iconData != null
                                ? SvgPicture.asset(
                                    widget.iconData!,
                                    fit: BoxFit.scaleDown,
                                  )
                                : null,
              ),
            ),
          ),
        ),
        widget.isValidate
            ? SizedBox(
                width: context.deviceWidth,
                child: Text(
                  appLocalizations.checkAccountEnterAgain,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.instance.borderErrorColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 9.2.sp,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
