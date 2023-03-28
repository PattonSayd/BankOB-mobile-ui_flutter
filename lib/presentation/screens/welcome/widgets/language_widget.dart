import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';
import '../viewmodels/language_model.dart';

class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({Key? key}) : super(key: key);

  @override
  State<LanguagesWidget> createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends State<LanguagesWidget> {
  String _currentLanguage = 'az';

  late final List<LanguageModel> _languageList;

  @override
  void initState() {
    super.initState();
    _languageList = [
      LanguageModel(
        languageImage: AppAssets.flagAzerbaijan,
        languageText: 'Azərbaycan dili',
        languageCode: 'az',
      ),
      LanguageModel(
        languageImage: AppAssets.flagRussian,
        languageText: 'Русский',
        languageCode: 'ru',
      ),
      LanguageModel(
        languageImage: AppAssets.flagEnglish,
        languageText: 'English',
        languageCode: 'en',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _languageList
          .map((LanguageModel language) => _buildLanguages(language))
          .toList(),
    );
  }

  Widget _buildLanguages(LanguageModel language) => InkWell(
        onTap: () {
          setState(() {
            _currentLanguage = language.languageCode;
          });
        },
        child: Container(
          padding: context.paddingAll16,
          decoration: BoxDecoration(
            color: _currentLanguage == language.languageCode
                ? AppColors.instance.selectedTileColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: context.borderRadiusAll(100),
                child: SvgPicture.asset(
                  language.languageImage,
                  height: 3.16.h,
                  width: 3.16.h,
                ),
              ),
              SizedBox(width: 3.6.w),
              Text(
                language.languageText,
                style: AppTextStyles.kLanguageTextStyle,
              ),
              const Spacer(),
              Device.screenType == ScreenType.tablet
                  ? Transform.scale(
                      scale: 1.8,
                      child: _buildRadio(language),
                    )
                  : SizedBox(
                      height: 2.63.h,
                      width: 2.63.h,
                      child: _buildRadio(language)),
            ],
          ),
        ),
      );

  Radio<String> _buildRadio(LanguageModel language) {
    return Radio(
      value: language.languageCode,
      groupValue: _currentLanguage,
      onChanged: (value) {
        setState(() {
          _currentLanguage = value.toString();
        });
      },
    );
  }
}
