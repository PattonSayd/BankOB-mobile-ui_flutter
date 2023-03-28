import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/extensions/context_extension.dart';
import '../../../../../app/styles/app_text_styles.dart';
import '../../../../../app/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionDateWigdet extends StatelessWidget {
  final int? interval;
  const TransactionDateWigdet({
    super.key,
    this.interval = 0,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DateInitialWidget(
            labelText: appLocalizations.from,
            interval: interval,
          ),
        ),
        SizedBox(width: 1.58.h),
        Expanded(
          child: DateInitialWidget(
            labelText: appLocalizations.to,
            interval: interval,
            currencyDate: true,
          ),
        ),
      ],
    );
  }
}

class DateInitialWidget extends StatefulWidget {
  final String labelText;
  final int? interval;
  final bool? currencyDate;

  const DateInitialWidget({
    Key? key,
    required this.labelText,
    this.interval,
    this.currencyDate,
  }) : super(key: key);

  @override
  State<DateInitialWidget> createState() => _DateInitialWidgetState();
}

class _DateInitialWidgetState extends State<DateInitialWidget> {
  late DateTime _dateNow;
  late String _dateInitial = '';

  void _selectDate() async {
    DateTime? dateTime = (await showDatePicker(
      context: context,
      initialDate: _dateNow,
      firstDate: DateTime.now().subtract(Duration(days: widget.interval!)),
      lastDate: DateTime.now(),
    ));

    if (dateTime != null) {
      setState(() {
        _dateInitial = DateFormat('dd.MM.yyyy').format(dateTime);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateNow = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.37.h,
      padding: context.paddingSymmetric(2.1.h, 1.05.h),
      decoration: BoxDecoration(
        color: AppColors.instance.inputColor,
        borderRadius: context.borderRadiusAll8,
        border: Border.all(
          color: AppColors.instance.borderInactiveColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.labelText,
                  style: AppTextStyles.kLabelTextStyle
                      .copyWith(fontSize: 14.65.sp),
                  strutStyle: AppStrutStyles.kCaption,
                ),
                Text(
                  _dateInitial.isNotEmpty
                      ? _dateInitial
                      : widget.currencyDate != null
                          ? DateFormat('dd.MM.yyyy').format(_dateNow)
                          : DateFormat('dd.MM.yyyy').format(_dateNow
                              .subtract(Duration(days: widget.interval!))),
                  style: AppTextStyles.kInputTextStyle
                      .copyWith(fontSize: 15.85.sp),
                  strutStyle: AppStrutStyles.kBodyS,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              icon: Icon(
                Icons.calendar_today_outlined,
                color: AppColors.instance.primaryColor,
              ),
              onPressed: () => _selectDate(),
            ),
          )
        ],
      ),
    );
  }
}
