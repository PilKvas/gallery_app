part of '../core.dart';

class AppConst {

  static const refreshTokenStorageKey = 'refreshToken';

  static const accessTokenStorageKey = 'accessToken';

  static const apiUrl = 'https://gallery.prod1.webant.ru';

  static const apiUrlMedia = 'https://gallery.prod1.webant.ru/media/';

  static const clientId = '1_3fxvjh2ky7s44cskwcgo0k8cwwogkocs8k4cwcwsg0skcsw4ok';

  static const clientSecret =
      '4tf1qez2dc4ksg8w4og4co4w40s0gokwwkwkss8gc400owkokc';

  static const key = 'hasRunBefore';

  static const userKey = 'user';

  static const int limit = 10;

  static const int profileLimit = 40;

  static const empty = '';

  static const regExpEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static final phoneMask = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {'#': RegExp('[0-9]')},
  );
}
