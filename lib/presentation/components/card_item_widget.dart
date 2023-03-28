import 'dart:ui';

import 'package:bank_of_baku_app/app/constants/app_assets.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:bank_of_baku_app/app/styles/app_shadow.dart';
import 'package:bank_of_baku_app/app/styles/app_text_styles.dart';
import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardItemWidget extends StatefulWidget {
  const CardItemWidget({Key? key}) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  late bool cardAccountObscure = false;
  late bool cardNumObscure = false;
  late bool cardCodeObscure = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: AppBoxDecorations.kMainCardBoxDecoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildObsecureEyeIcon],
              ),
            ),
            _buildCardAmount,
            const SizedBox(height: 10),
            _buildCardNumber,
            const SizedBox(height: 15.5),
            _buildCardDateAndCvv,
            SizedBox(height: 2.2.h),
          ],
        ),
      ),
    );
  }

  Widget get _buildObsecureEyeIcon => Padding(
        padding: const EdgeInsets.only(right: 6),
        child: GestureDetector(
          onTap: () => setState(() => cardAccountObscure = !cardAccountObscure),
          child: cardAccountObscure
              ? Image.asset(AppAssets.eyeObsecure)
              : Image.asset(AppAssets.eye),
        ),
      );

  TextSpan _buildTextSpan(String text, FontWeight fontWeight) => TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 17.sp,
          letterSpacing: -0.45,
          fontWeight: fontWeight,
          shadows: [
            !cardAccountObscure ? AppShadow.addCardTextShadow : const Shadow(),
          ],
        ),
      );

  Widget get _buildCardAmount => RichText(
        text: TextSpan(
          style: TextStyle(
            foreground: cardAccountObscure
                ? (Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.white
                  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5))
                : Paint()
              ..color = Colors.white,
          ),
          children: [
            _buildTextSpan('3 700.00', FontWeight.w600),
            _buildTextSpan('₼'.padLeft(2), FontWeight.w300),
          ],
        ),
      );

  Widget get _buildCardNumber => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: AppColors.instance.cardGradientColors),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: (() => setState(() => cardNumObscure = !cardNumObscure)),
                child: Text(
                  cardNumObscure
                      ? '****  ****  ****  9876'
                      : '1234  5432  5678  9876',
                  style: AppTextStyles.kBigCardNumberTextStyle,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _buildCardDateAndCvv => Padding(
        padding: context.paddingHorizontal20,
        child: Row(
          children: [
            Text(
              '09/24',
              style: AppTextStyles.kAddCardDateTextStyle,
            ),
            const SizedBox(width: 16),
            Container(
              height: 2.2.h,
              padding: const EdgeInsets.symmetric(horizontal: 5.5),
              decoration: AppBoxDecorations.kCvvBoxDecoration,
              child: GestureDetector(
                onTap: (() =>
                    setState(() => cardCodeObscure = !cardCodeObscure)),
                child: Align(
                  child: Text(
                    cardCodeObscure ? 'CVV' : '123',
                    style: AppTextStyles.kCvvTextStyle,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              AppAssets.visa,
              width: 36,
            ),
          ],
        ),
      );
}
