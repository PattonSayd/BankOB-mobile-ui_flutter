import 'package:flutter/material.dart';

import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';

class GlobalInput extends StatefulWidget {
  final String labelText;
  final TextEditingController inputController;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final FocusNode inputFocus;
  final bool obscureText;

  const GlobalInput({
    Key? key,
    required this.labelText,
    required this.inputController,
    this.onChanged,
    this.onValidate,
    required this.inputFocus,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  bool _isVisible = false;
  bool _isActive = false;

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
  void dispose() {
    super.dispose();
    widget.inputFocus.removeListener(listenFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.inputColor,
        borderRadius: context.borderRadiusAll8,
        border: Border.all(
          color: _isActive
              ? AppColors.instance.borderActiveColor
              : AppColors.instance.borderInactiveColor,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: widget.inputController,
          focusNode: widget.inputFocus,
          onChanged: widget.onChanged,
          validator: widget.onValidate,
          obscureText: _isVisible ? false : widget.obscureText,
          style: AppTextStyles.kInputTextStyle,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            labelText: widget.labelText,
            floatingLabelStyle: Theme.of(context)
                .textTheme
                .caption!
                .merge(AppTextStyles.kFloatingLabelStyle),
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
                : null,
          ),
        ),
      ),
    );
  }
}
