import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'In the Dostbank app, we saw you very happy!'**
  String get welcomeMessage;

  /// No description provided for @startYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Start your journey'**
  String get startYourJourney;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @continueAsMeggy.
  ///
  /// In en, this message translates to:
  /// **'Continue as Meggy'**
  String get continueAsMeggy;

  /// No description provided for @addNewUser.
  ///
  /// In en, this message translates to:
  /// **'Add new user'**
  String get addNewUser;

  /// No description provided for @nearestBranch.
  ///
  /// In en, this message translates to:
  /// **'Nearest Branch'**
  String get nearestBranch;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @loanOrder.
  ///
  /// In en, this message translates to:
  /// **'Loan Order'**
  String get loanOrder;

  /// No description provided for @cardOrder.
  ///
  /// In en, this message translates to:
  /// **'Card Order'**
  String get cardOrder;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @clientsCodeOrPin.
  ///
  /// In en, this message translates to:
  /// **'Client’s code or FIN'**
  String get clientsCodeOrPin;

  /// No description provided for @otpCode.
  ///
  /// In en, this message translates to:
  /// **'OTP code'**
  String get otpCode;

  /// No description provided for @otpMessage.
  ///
  /// In en, this message translates to:
  /// **'Include the OTP code sent via SMS to your mobile number'**
  String get otpMessage;

  /// No description provided for @remainingTime.
  ///
  /// In en, this message translates to:
  /// **'Remaining time: '**
  String get remainingTime;

  /// No description provided for @getSms.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get SMS?'**
  String get getSms;

  /// No description provided for @sendAgain.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get sendAgain;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN code'**
  String get enterPin;

  /// No description provided for @forgotPin.
  ///
  /// In en, this message translates to:
  /// **'Forgot Pin'**
  String get forgotPin;

  /// No description provided for @forgotPinQuestion.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN?'**
  String get forgotPinQuestion;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @youCanEnterAppText.
  ///
  /// In en, this message translates to:
  /// **'Artıq tətbiqə yeni şifrə ilə daxil ola bilərsən!'**
  String get youCanEnterAppText;

  /// No description provided for @exitAppText.
  ///
  /// In en, this message translates to:
  /// **'Tətbiqdən çıxış'**
  String get exitAppText;

  /// No description provided for @sureToExitAppText.
  ///
  /// In en, this message translates to:
  /// **'Tətbiqdən çıxmaq istədiyinə əminsən?'**
  String get sureToExitAppText;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Confirm fingerprint'**
  String get confirmFingerprint;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @touchFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Touch fingerprint sensor to log in'**
  String get touchFingerprint;

  /// No description provided for @newText.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newText;

  /// No description provided for @templates.
  ///
  /// In en, this message translates to:
  /// **'Templates'**
  String get templates;

  /// No description provided for @addTemplates.
  ///
  /// In en, this message translates to:
  /// **'Şablon elave et'**
  String get addTemplates;

  /// No description provided for @makeYourPaymentEasy.
  ///
  /// In en, this message translates to:
  /// **'Make your payments easy'**
  String get makeYourPaymentEasy;

  /// No description provided for @bonuses.
  ///
  /// In en, this message translates to:
  /// **'Bonuslar'**
  String get bonuses;

  /// No description provided for @topPicks.
  ///
  /// In en, this message translates to:
  /// **'Top picks'**
  String get topPicks;

  /// No description provided for @forYou.
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get forYou;

  /// No description provided for @addYourFavorite.
  ///
  /// In en, this message translates to:
  /// **'Add your favourite'**
  String get addYourFavorite;

  /// No description provided for @customiseContentMainPage.
  ///
  /// In en, this message translates to:
  /// **'Customise content on main page'**
  String get customiseContentMainPage;

  /// No description provided for @checkAccountEnterAgain.
  ///
  /// In en, this message translates to:
  /// **'Hesabı yoxlayın yenidən daxil edin'**
  String get checkAccountEnterAgain;

  /// No description provided for @standartCardReady.
  ///
  /// In en, this message translates to:
  /// **'Standart kartı hazırdır!'**
  String get standartCardReady;

  /// No description provided for @cardShippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Kartın çatdırılacağı ünvan: Bakı, Şıxəli Qurbanov küçəsi ev 90, mən 41. Təxmini çatdırılma vaxtı: 05.04.2020.'**
  String get cardShippingAddress;

  /// No description provided for @isClear.
  ///
  /// In en, this message translates to:
  /// **'Aydindir'**
  String get isClear;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Məbləğ'**
  String get salary;

  /// No description provided for @cardDetails.
  ///
  /// In en, this message translates to:
  /// **'Card Details'**
  String get cardDetails;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Kartin nomresi'**
  String get cardNumber;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Bitme tarixi'**
  String get expirationDate;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @checkCardActivity.
  ///
  /// In en, this message translates to:
  /// **'Kartin aktivliyini yoxlamaq uchun sizin hesabinizdan 0.09 ₼ tutulacaq ve balansiniza geri qaytarilacaq'**
  String get checkCardActivity;

  /// No description provided for @bankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Bank hesablari'**
  String get bankAccounts;

  /// No description provided for @sender.
  ///
  /// In en, this message translates to:
  /// **'Gonderen'**
  String get sender;

  /// No description provided for @chooseProperAccount.
  ///
  /// In en, this message translates to:
  /// **'Muvafiq hesabi sec'**
  String get chooseProperAccount;

  /// No description provided for @reciever.
  ///
  /// In en, this message translates to:
  /// **'Qebul eden'**
  String get reciever;

  /// No description provided for @getterAccountAndInfo.
  ///
  /// In en, this message translates to:
  /// **'Alanin hesabi ve melumatlari'**
  String get getterAccountAndInfo;

  /// No description provided for @transferClassification.
  ///
  /// In en, this message translates to:
  /// **'Kochurmenin tesnifati'**
  String get transferClassification;

  /// No description provided for @budgeClassification.
  ///
  /// In en, this message translates to:
  /// **'Budce tesnifati'**
  String get budgeClassification;

  /// No description provided for @budgeLevel.
  ///
  /// In en, this message translates to:
  /// **'Budce seviyyesi'**
  String get budgeLevel;

  /// No description provided for @noneWorkDayInfo.
  ///
  /// In en, this message translates to:
  /// **'Saat 17:00-dan sonra ve qeyri-is gunleri edilen kocurmeler yalniz novbeti is gununde icra edilir'**
  String get noneWorkDayInfo;

  /// No description provided for @senderNumber.
  ///
  /// In en, this message translates to:
  /// **'Gonderen nomre'**
  String get senderNumber;

  /// No description provided for @recieverNumber.
  ///
  /// In en, this message translates to:
  /// **'Qebul eden nomre'**
  String get recieverNumber;

  /// No description provided for @concurrency.
  ///
  /// In en, this message translates to:
  /// **'Valyuta'**
  String get concurrency;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @transferHistory.
  ///
  /// In en, this message translates to:
  /// **'Köçürmələr tarixi'**
  String get transferHistory;

  /// No description provided for @tryRepeatSomePinCode.
  ///
  /// In en, this message translates to:
  /// **'Try repeat same pincode'**
  String get tryRepeatSomePinCode;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income: '**
  String get income;

  /// No description provided for @transferList.
  ///
  /// In en, this message translates to:
  /// **'Transfers list'**
  String get transferList;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Tamamlanan'**
  String get completed;

  /// No description provided for @inCountry.
  ///
  /// In en, this message translates to:
  /// **'Olke daxilinde'**
  String get inCountry;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Elave melumat'**
  String get additionalInfo;

  /// No description provided for @urgentOrder.
  ///
  /// In en, this message translates to:
  /// **'Tecili sifarish'**
  String get urgentOrder;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Təsdiq'**
  String get confirmation;

  /// No description provided for @checkTransferInfo.
  ///
  /// In en, this message translates to:
  /// **'Kochurme məlumatlarını yoxla'**
  String get checkTransferInfo;

  /// No description provided for @commision.
  ///
  /// In en, this message translates to:
  /// **'Komissiya'**
  String get commision;

  /// No description provided for @commonSalary.
  ///
  /// In en, this message translates to:
  /// **'Ümumi məbləğ'**
  String get commonSalary;

  /// No description provided for @universal.
  ///
  /// In en, this message translates to:
  /// **'Universal'**
  String get universal;

  /// No description provided for @cashByCode.
  ///
  /// In en, this message translates to:
  /// **'Cash by Code'**
  String get cashByCode;

  /// No description provided for @stationaryPhones.
  ///
  /// In en, this message translates to:
  /// **'Stasionar telefonlar'**
  String get stationaryPhones;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Axtar'**
  String get search;

  /// No description provided for @receipt.
  ///
  /// In en, this message translates to:
  /// **'Qebz'**
  String get receipt;

  /// No description provided for @moneyTransfers.
  ///
  /// In en, this message translates to:
  /// **'Pul kochurmeleri'**
  String get moneyTransfers;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @saveAsATemplate.
  ///
  /// In en, this message translates to:
  /// **'Save as a template'**
  String get saveAsATemplate;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['az', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az': return AppLocalizationsAz();
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
