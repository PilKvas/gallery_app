// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "WelcomeText":
            MessageLookupByLibrary.simpleMessage("Welcome to Gallery!"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("I already have an account"),
        "birthday": MessageLookupByLibrary.simpleMessage("Birthday"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirmFieldValidationText":
            MessageLookupByLibrary.simpleMessage("Password doesn\'t match"),
        "confirmPasswordRequired":
            MessageLookupByLibrary.simpleMessage("Confirm password *"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailRequired": MessageLookupByLibrary.simpleMessage("Email *"),
        "emailValidationText": MessageLookupByLibrary.simpleMessage(
            "This field should contain E-Mail in the format example@site.com"),
        "emptyFieldValidationText":
            MessageLookupByLibrary.simpleMessage("Required field"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "newTab": MessageLookupByLibrary.simpleMessage("New"),
        "ohShuks": MessageLookupByLibrary.simpleMessage("oh Shucks"),
        "onSearch": MessageLookupByLibrary.simpleMessage("There is no photo"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage("Password *"),
        "passwordValidationText": MessageLookupByLibrary.simpleMessage(
            "This field must contain a password of at least 8 characters long"),
        "phoneNumberRequired":
            MessageLookupByLibrary.simpleMessage("Phone number *"),
        "phoneValidationText": MessageLookupByLibrary.simpleMessage(
            "This field must contain a number in the format +# (###) ### ### ## ## ##"),
        "popularTab": MessageLookupByLibrary.simpleMessage("Popular"),
        "registrationSuccessful": MessageLookupByLibrary.simpleMessage(
            "You have been successfully registered"),
        "searchField": MessageLookupByLibrary.simpleMessage("Search"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "userNameRequired": MessageLookupByLibrary.simpleMessage("User Name *")
      };
}
