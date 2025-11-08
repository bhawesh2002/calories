import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('en')
  ];

  /// Greeting message addressing the user by name.
  ///
  /// In en, this message translates to:
  /// **'Hi Homer!'**
  String get greeting;

  /// Motivational header encouraging user to begin a healthy day.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start your\nhealthy day'**
  String get startHealthyDay;

  /// Label showing how many kilocalories the user has left for the day.
  ///
  /// In en, this message translates to:
  /// **'Kcal left'**
  String get kcalLeft;

  /// Label for the fat nutritional value.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// Label for protein nutritional value.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get protein;

  /// Label for carbohydrate nutritional value.
  ///
  /// In en, this message translates to:
  /// **'Carb'**
  String get carbohydrates;

  /// Title text for the recipe suggestion section.
  ///
  /// In en, this message translates to:
  /// **'Best recipes for you'**
  String get bestRecipesForYou;

  /// Filter option to show all recipes.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Filter option for breakfast recipes.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get breakfast;

  /// Filter option for lunch recipes.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// Filter option for dinner recipes.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get dinner;

  /// Filter option for snack recipes.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get snack;

  /// Name of the oatmeal recipe.
  ///
  /// In en, this message translates to:
  /// **'Lazy Oatmeal'**
  String get lazyOatmeal;

  /// Recipe metadata showing ingredients count, preparation time, and calories.
  ///
  /// In en, this message translates to:
  /// **'12 ingredients · 45 min · 470 kcal'**
  String get recipeMeta;

  /// Heading for the recipe description section.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionTitle;

  /// Full description text for the lazy oatmeal recipe.
  ///
  /// In en, this message translates to:
  /// **'Lazy oatmeal is the perfect solution for busy mornings or for those who want a hassle-free, nutritious breakfast with minimal effort.'**
  String get lazyOatmealDescription;

  /// Title for the nutritional breakdown section.
  ///
  /// In en, this message translates to:
  /// **'Nutritional value'**
  String get nutritionalValue;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
