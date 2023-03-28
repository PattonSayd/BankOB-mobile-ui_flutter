import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../../app/styles/app_text_styles.dart';
import '../../widgets/global_appbar.dart';
import '../../widgets/global_button.dart';
import 'widgets/add_card_item_widget.dart';
import 'widgets/add_cart_text_fields_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.addCard),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 4.2.h),
            const AddCardItemWidget(),
            SizedBox(height: 3.8.h),
            Padding(
              padding: context.paddingHorizontal16,
              child: Text(
                appLocalizations.checkCardActivity,
                style: AppTextStyles.kInputTextStyle
                    .copyWith(wordSpacing: 2, fontSize: 14),
              ),
            ),
            SizedBox(height: 3.2.h),
            const AddCardTextFieldWidget(),
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: context.paddingSymmetric(2.h, 3.3.h),
          child: GlobalButton(buttonText: appLocalizations.addCard),
        ),
      ),
    );
  }
}
