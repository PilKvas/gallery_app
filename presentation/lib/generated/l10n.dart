// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `oh Shucks`
  String get ohShuks {
    return Intl.message(
      'oh Shucks',
      name: 'ohShuks',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newTab {
    return Intl.message(
      'New',
      name: 'newTab',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popularTab {
    return Intl.message(
      'Popular',
      name: 'popularTab',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchField {
    return Intl.message(
      'Search',
      name: 'searchField',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `There is no photo`
  String get onSearch {
    return Intl.message(
      'There is no photo',
      name: 'onSearch',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Gallery!`
  String get WelcomeText {
    return Intl.message(
      'Welcome to Gallery!',
      name: 'WelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'I already have an account',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `User Name *`
  String get userNameRequired {
    return Intl.message(
      'User Name *',
      name: 'userNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Phone number *`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone number *',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email *`
  String get emailRequired {
    return Intl.message(
      'Email *',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password *`
  String get passwordRequired {
    return Intl.message(
      'Password *',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password *`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password *',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `This field must contain a password of at least 8 characters long`
  String get passwordValidationText {
    return Intl.message(
      'This field must contain a password of at least 8 characters long',
      name: 'passwordValidationText',
      desc: '',
      args: [],
    );
  }

  /// `This field should contain E-Mail in the format example@site.com`
  String get emailValidationText {
    return Intl.message(
      'This field should contain E-Mail in the format example@site.com',
      name: 'emailValidationText',
      desc: '',
      args: [],
    );
  }

  /// `This field must contain a number in the format +# (###) ### ### ## ## ##`
  String get phoneValidationText {
    return Intl.message(
      'This field must contain a number in the format +# (###) ### ### ## ## ##',
      name: 'phoneValidationText',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get emptyFieldValidationText {
    return Intl.message(
      'Required field',
      name: 'emptyFieldValidationText',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn't match`
  String get confirmFieldValidationText {
    return Intl.message(
      'Password doesn\'t match',
      name: 'confirmFieldValidationText',
      desc: '',
      args: [],
    );
  }

  /// `You have been successfully registered`
  String get registrationSuccessful {
    return Intl.message(
      'You have been successfully registered',
      name: 'registrationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username and password combination`
  String get badRequestText {
    return Intl.message(
      'Invalid username and password combination',
      name: 'badRequestText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
