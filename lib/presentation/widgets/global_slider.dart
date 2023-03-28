import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:flutter/material.dart';

import '../../app/custom_paint/circle_thumb_shape.dart';
import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';

class GlobalSlider extends StatefulWidget {
  final String labeltext;
  final String currency;
  final double maxAmount;
  final double minAmount;

  const GlobalSlider({
    Key? key,
    required this.labeltext,
    required this.currency,
    required this.maxAmount,
    required this.minAmount,
  }) : super(key: key);

  @override
  State<GlobalSlider> createState() => _GlobalSliderState();
}

class _GlobalSliderState extends State<GlobalSlider> {
  TextEditingController controller = TextEditingController(text: '0.00');
  double _currentValue = 0;

  void onChanged(value) {
    var strValue = value.toString();
    if (strValue.length == 6) {
      strValue =
          "${strValue.substring(0, 1)} ${strValue.substring(1, strValue.length)}";
    } else if (strValue.length == 7) {
      strValue =
          "${strValue.substring(0, 2)} ${strValue.substring(2, strValue.length)}";
    }

    _currentValue = value;
    controller.text = '${strValue}0';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 62,
          width: context.deviceWidth,
          decoration: AppBoxDecorations.kSliderFieldBoxDecoration(context),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: context.paddingSymmetric(16, 12),
                child: Text(
                  widget.labeltext,
                  style: AppTextStyles.kInputTextStyle.copyWith(fontSize: 12),
                ),
              ),
              IntrinsicWidth(
                child: TextFormField(
                  controller: controller,
                  readOnly: true,
                  style: AppTextStyles.kInputTextStyle,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    suffix: Text(widget.currency,
                        style: TextStyle(
                            color: AppColors.instance.currencyTextColor)),
                    labelText: '',
                    contentPadding: context.paddingSymmetric(16, 12),
                  ),
                ),
              ),
              Positioned(
                left: -16,
                right: -16,
                top: 36,
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: AppColors.instance.primaryColor, 
                    inactiveTickMarkColor: AppColors.instance.borderInactiveColor, 
                    inactiveTrackColor: AppColors.instance.borderInactiveColor, 
                    thumbShape: const CircleThumbShape(thumbRadius: 8), 
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: widget.minAmount,
                    max: widget.maxAmount,
                    divisions: 30,
                    onChanged: onChanged,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: context.paddingAll(8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SubTextSlider(
                subText: widget.minAmount
                    .toString()
                    .substring(0, widget.minAmount.toString().length - 2)),
            SubTextSlider(
              subText: widget.maxAmount
                  .toString()
                  .substring(0, widget.maxAmount.toString().length - 2),
            ),
          ]),
        )
      ],
    );
  }
}

class SubTextSlider extends StatelessWidget {
  final String subText;

  const SubTextSlider({
    Key? key,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subText,
      style: AppTextStyles.kInputTextStyle.copyWith(fontSize: 12),
    );
  }
}
