import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:bank_of_baku_app/presentation/screens/main/widgets/dotted_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/extensions/context_extension.dart';
import '../../../../app/global/global_bottom_sheet.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_dropdown_button.dart';
import '../../../widgets/global_empty_size.dart';
import '../../../widgets/global_text_fileds.dart';

class PaymentFormScreen extends StatefulWidget {
  const PaymentFormScreen({super.key});

  @override
  State<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends State<PaymentFormScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController recieverNumberController;
  late final FocusNode recieverNumberFocus;
  final List regionList = [
    'Baku, Absheron(12)',
    'Baku, Absheron(13)',
    'Baku, Absheron(14)'
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    recieverNumberController = TextEditingController();
    recieverNumberFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    recieverNumberController.dispose();
    recieverNumberFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: const GlobalAppBar(titleText: 'Katv 1'),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.16.h),
              GlobalDropDownButton(
                labelText: 'Region',
                dropdownItems: [regionList[currentIndex]],
                onTap: () {
                  GlobalBottomSheet.showGlobalModal(
                    context,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select currency',
                          style: TextStyle(
                            color: AppColors.instance.textBlackColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.45,
                            fontSize: 18.95.sp,
                          ),
                          strutStyle: AppStrutStyles.kTitle,
                        ),
                        SizedBox(height: 1.05.h),
                        ListView.separated(
                          itemCount: regionList.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const DividerTheme(
                            data: DividerThemeData(space: 0),
                            child: Divider(
                              thickness: 0.5,
                              color: Color(0xFFF0F2F2),
                            ),
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  regionList[index],
                                  style: TextStyle(
                                    color: AppColors.instance.textBlackColor,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.31,
                                    fontSize: 16.95.sp,
                                  ),
                                  strutStyle: AppStrutStyles.kBodyM,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: 'Mobil nomre',
                inputController: recieverNumberController,
                inputFocus: recieverNumberFocus,
              ),
              SizedBox(height: 2.63.h),
              Text(
                'Ödəniş üsulu',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF797e80),
                ),
                strutStyle: AppStrutStyles.kCaption,
              ),
              SizedBox(height: 0.26.h),
              DottedBox(
                title: 'Kart və ya hesabı seç',
                dottedButtonSize: 32,
                borderRadius: 8,
                onPress: () {},
              ),
              const GlobalEmptySize(),
              const GlobalButton(buttonText: 'Davam et', buttonTap: null),
              SizedBox(height: 2.1.h),
            ],
          ),
        ),
      ),
    );
  }
}
