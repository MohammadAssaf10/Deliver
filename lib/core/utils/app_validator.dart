import '../../generated/l10n.dart';
import 'app_extensions.dart';
import 'app_regex.dart';

class AppValidator {
  AppValidator._();

  static String? mobileNumberValidator(String? phone) {
    if (phone.nullOrEmpty()) {
      return S.current.pleaseEnterMobileNumber;
    } else if (!AppRegex.isMobileNumberValid(phone!) ||
        phone.length < 10 ||
        phone.length > 10 ||
        !phone.startsWith("09")) {
      return S.current.mobileNumberFormatNotCorrect;
    }
    return null;
  }

  static String? usernameValidator(String? name) {
    if (name.nullOrEmpty()) {
      return S.current.pleaseEnterUserName;
    } else if (name!.length < 3) {
      return S.current.usernameShort;
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password.nullOrEmpty()) {
      return S.current.pleaseEnterPassword;
    } else if (password!.length < 8) {
      return S.current.passwordShouldAtLeast8Character;
    }
    return null;
  }
}
