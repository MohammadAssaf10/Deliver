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

  /// `Deliver`
  String get deliver {
    return Intl.message(
      'Deliver',
      name: 'deliver',
      desc: '',
      args: [],
    );
  }

  /// `There is problem with your connection, please try again`
  String get networkError {
    return Intl.message(
      'There is problem with your connection, please try again',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
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

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email format not correct`
  String get emailFormatNotCorrect {
    return Intl.message(
      'Email format not correct',
      name: 'emailFormatNotCorrect',
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

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should at least 8 character`
  String get passwordShouldAtLeast8Character {
    return Intl.message(
      'Password should at least 8 character',
      name: 'passwordShouldAtLeast8Character',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter username`
  String get pleaseEnterUserName {
    return Intl.message(
      'Please enter username',
      name: 'pleaseEnterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Username is short`
  String get usernameShort {
    return Intl.message(
      'Username is short',
      name: 'usernameShort',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mobile number`
  String get pleaseEnterMobileNumber {
    return Intl.message(
      'Please enter mobile number',
      name: 'pleaseEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number format not correct`
  String get mobileNumberFormatNotCorrect {
    return Intl.message(
      'Mobile number format not correct',
      name: 'mobileNumberFormatNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Please complete field`
  String get pleaseCompleteField {
    return Intl.message(
      'Please complete field',
      name: 'pleaseCompleteField',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
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

  /// `Login Here`
  String get loginHere {
    return Intl.message(
      'Login Here',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }

  /// `Register Here`
  String get registerHere {
    return Intl.message(
      'Register Here',
      name: 'registerHere',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signInToYourAccount {
    return Intl.message(
      'Sign in to your account',
      name: 'signInToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up your account`
  String get signUpYourAccount {
    return Intl.message(
      'Sign Up your account',
      name: 'signUpYourAccount',
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

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get haveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! Take a trip to your destination with the cheapest fare`
  String get onBoarding1 {
    return Intl.message(
      'Welcome! Take a trip to your destination with the cheapest fare',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `My Trip`
  String get myTrip {
    return Intl.message(
      'My Trip',
      name: 'myTrip',
      desc: '',
      args: [],
    );
  }

  /// `Add trip`
  String get addTrip {
    return Intl.message(
      'Add trip',
      name: 'addTrip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome `
  String get welcome {
    return Intl.message(
      'Welcome ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please turn on location service and try again`
  String get pleaseTurnOnLocationServiceAndTryAgain {
    return Intl.message(
      'Please turn on location service and try again',
      name: 'pleaseTurnOnLocationServiceAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please allow app to access your current location and try again`
  String get pleaseAllowAppToAccessYourCurrentLocationAndTryAgain {
    return Intl.message(
      'Please allow app to access your current location and try again',
      name: 'pleaseAllowAppToAccessYourCurrentLocationAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Get Start With Deliver`
  String get getStartWithDeliver {
    return Intl.message(
      'Get Start With Deliver',
      name: 'getStartWithDeliver',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue1 {
    return Intl.message(
      'Continue',
      name: 'continue1',
      desc: '',
      args: [],
    );
  }

  /// `We sent OTP code to verify your number`
  String get weSentOTPCodeToVerifyYourNumber {
    return Intl.message(
      'We sent OTP code to verify your number',
      name: 'weSentOTPCodeToVerifyYourNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter verification code`
  String get pleaseEnterVerificationCode {
    return Intl.message(
      'Please enter verification code',
      name: 'pleaseEnterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please complete verification code`
  String get pleaseCompleteVerificationCode {
    return Intl.message(
      'Please complete verification code',
      name: 'pleaseCompleteVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Enter your account details here.`
  String get enterYourAccountDetailsHere {
    return Intl.message(
      'Enter your account details here.',
      name: 'enterYourAccountDetailsHere',
      desc: '',
      args: [],
    );
  }

  /// `Kindly sign up below.`
  String get kindlySignUpBelow {
    return Intl.message(
      'Kindly sign up below.',
      name: 'kindlySignUpBelow',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
