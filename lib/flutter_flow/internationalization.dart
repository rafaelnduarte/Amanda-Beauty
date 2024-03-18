import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Event
  {
    '8lh4b7u1': {
      'en': 'Due',
      'pt': '',
    },
    '8vsoryqb': {
      'en': 'Scheduled',
      'pt': '',
    },
    'a7y579rn': {
      'en': 'Artist',
      'pt': '',
    },
    'x5y12vj5': {
      'en': 'Services',
      'pt': '',
    },
    'lpdj0nvi': {
      'en': 'Bride\'s Phone',
      'pt': '',
    },
    'dmxzct1e': {
      'en': 'Planner\'s Phone',
      'pt': '',
    },
    'cdt8inpk': {
      'en': 'Notes',
      'pt': '',
    },
    'zv1le2jt': {
      'en': 'Mark as Complete',
      'pt': '',
    },
    'rengfa5i': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Auth_Login
  {
    'cbkfdgm2': {
      'en': 'Sign In',
      'pt': '',
    },
    'yodgfi3x': {
      'en': 'Email Address',
      'pt': '',
    },
    'hody3glm': {
      'en': 'Enter your email...',
      'pt': '',
    },
    'kihuhfg8': {
      'en': 'Password',
      'pt': '',
    },
    'tj2t92c9': {
      'en': 'Enter your password...',
      'pt': '',
    },
    'm577f4k1': {
      'en': 'Sign In',
      'pt': '',
    },
    'wfr8941y': {
      'en': 'Create an account',
      'pt': '',
    },
    'm8bwdl1d': {
      'en': 'Forgot Password?',
      'pt': '',
    },
    'q7mt6m3r': {
      'en': 'Or use a social account to login',
      'pt': '',
    },
    'r4m6dnra': {
      'en': 'Sign Up',
      'pt': '',
    },
    '67kwx1wp': {
      'en': 'Username',
      'pt': '',
    },
    'oiryl8mw': {
      'en': 'Enter your username',
      'pt': '',
    },
    '7sn30yag': {
      'en': 'Email Address',
      'pt': '',
    },
    '5xckjfvu': {
      'en': 'Enter your email...',
      'pt': '',
    },
    '552uoyh8': {
      'en': 'Password',
      'pt': '',
    },
    'k3tg4592': {
      'en': 'Enter your password...',
      'pt': '',
    },
    'fx0xgtob': {
      'en': 'Create Account',
      'pt': '',
    },
    'loo12s0b': {
      'en': 'Sign up using a social account',
      'pt': '',
    },
    '68yzm2h2': {
      'en': 'Field is required',
      'pt': '',
    },
    'rpd9nvxq': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'lpczp4ao': {
      'en': 'Field is required',
      'pt': '',
    },
    '0axm82nz': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'v04aqspc': {
      'en': 'Field is required',
      'pt': '',
    },
    'iwi1xhdn': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'wfrdu6y3': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Home_Calendar
  {
    'b2g61d3b': {
      'en': 'All Events',
      'pt': '',
    },
    'n72tcr95': {
      'en': 'Events',
      'pt': '',
    },
    'dap283ha': {
      'en': 'Filter',
      'pt': '',
    },
    '7c0wck3n': {
      'en': 'Upcoming',
      'pt': '',
    },
    'asd77hhk': {
      'en': 'Option 1',
      'pt': '',
    },
    'uitmtbol': {
      'en': 'Please select month',
      'pt': '',
    },
    '8a2ib59k': {
      'en': 'Search for an item...',
      'pt': '',
    },
    '2apzmh7d': {
      'en': 'Coming Up',
      'pt': '',
    },
    'fq0uivmu': {
      'en': 'Artist Profile',
      'pt': '',
    },
    '2ax9riwm': {
      'en': 'Settings',
      'pt': '',
    },
    'hxkompux': {
      'en': 'Logout',
      'pt': '',
    },
    'pccifuib': {
      'en': 'New Event',
      'pt': '',
    },
    '4csuibl2': {
      'en': 'Calendar',
      'pt': '',
    },
    'c1zug5h6': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Artist_Profile
  {
    'lzol0v71': {
      'en': 'Settings',
      'pt': '',
    },
    'rw710i81': {
      'en': 'Events',
      'pt': '',
    },
    '2vlvsg8u': {
      'en': 'Information',
      'pt': '',
    },
    'hi69wjzr': {
      'en': 'Name',
      'pt': '',
    },
    'd1ztrw3r': {
      'en': 'Phone Number',
      'pt': '',
    },
    'jimlwsr6': {
      'en': 'E-mail',
      'pt': '',
    },
    'iurrzss4': {
      'en': 'Services',
      'pt': '',
    },
    'cb2t4ghb': {
      'en': 'Services',
      'pt': '',
    },
    'brtmndc4': {
      'en': 'Log out of account',
      'pt': '',
    },
    'c7ljtpr2': {
      'en': 'Log Out?',
      'pt': '',
    },
    '3xtiebzs': {
      'en': 'Home',
      'pt': '',
    },
  },
  // maps
  {
    'u6l7po81': {
      'en': 'Page Title',
      'pt': '',
    },
    'fsbdj1gz': {
      'en': 'Home',
      'pt': '',
    },
  },
  // create_event
  {
    '29b9rce1': {
      'en': 'New Event',
      'pt': '',
    },
    'oziqpzel': {
      'en': 'Fill in the details of the event',
      'pt': '',
    },
    'f4j4z3i8': {
      'en': 'Name of the Event',
      'pt': '',
    },
    '1eb2gs91': {
      'en': 'Event Address',
      'pt': '',
    },
    '5r9ajvxo': {
      'en': 'Bride\'s Phone number',
      'pt': '',
    },
    'rmh77sy6': {
      'en': 'Planner\'s Phone number',
      'pt': '',
    },
    'gaauupa3': {
      'en': 'Note',
      'pt': '',
    },
    'mh4i651a': {
      'en': 'Option 1',
      'pt': '',
    },
    'xl1uiaeu': {
      'en': 'Select Event Type',
      'pt': '',
    },
    'dv5t8lmm': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'za9xq4hf': {
      'en': 'Option 1',
      'pt': '',
    },
    '4nf54co4': {
      'en': 'Select Services',
      'pt': '',
    },
    '18fre2uy': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'l613p1d9': {
      'en': 'Option 1',
      'pt': '',
    },
    'oz4t8111': {
      'en': 'Select Artists',
      'pt': '',
    },
    '5vvsozvd': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'nv90yzvl': {
      'en': 'Create New Event',
      'pt': '',
    },
    'kwx69uik': {
      'en': 'Home',
      'pt': '',
    },
  },
  // error_page
  {
    'j0qdwkh9': {
      'en': 'Oops!\nSomething went wrong.',
      'pt': '',
    },
    '1n3z5gy7': {
      'en': 'Take me to homepage',
      'pt': '',
    },
  },
  // edit_profile
  {
    'v4to9kmx': {
      'en': 'Edit your profile',
      'pt': '',
    },
    'rpy6nt9h': {
      'en': 'Name',
      'pt': '',
    },
    '5io7149o': {
      'en': 'Number',
      'pt': '',
    },
    'dr40n0zo': {
      'en': 'Option 1',
      'pt': '',
    },
    'wsih3ujw': {
      'en': 'Select Services',
      'pt': '',
    },
    '1w14d9it': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'svfpmwwj': {
      'en': 'Save Changes',
      'pt': '',
    },
  },
  // createAccount
  {
    'r8ypchvq': {
      'en': 'Get Started',
      'pt': '',
    },
    '76bq0idt': {
      'en': 'Let\'s get started by filling out the form below.',
      'pt': '',
    },
    '8y1mgxjz': {
      'en': 'Username',
      'pt': '',
    },
    '21vrx8zr': {
      'en': 'Email',
      'pt': '',
    },
    'de62s3y7': {
      'en': 'Password',
      'pt': '',
    },
    'b28u36zt': {
      'en': 'Create Account',
      'pt': '',
    },
    'zhwwm0lc': {
      'en': 'Field is required',
      'pt': '',
    },
    'otxvn818': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    '4qj3t9nc': {
      'en': 'Field is required',
      'pt': '',
    },
    's0wk7ada': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'ttq6w7vx': {
      'en': 'Field is required',
      'pt': '',
    },
    'fdtoh8rt': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'lqq32o70': {
      'en': 'Home',
      'pt': '',
    },
  },
  // EditEvent
  {
    '9zdxcwlw': {
      'en': 'Edit Event',
      'pt': '',
    },
    '9zbrkjgh': {
      'en': 'Fill in the details of the event',
      'pt': '',
    },
    'fm5shp9z': {
      'en': 'Name of the Event',
      'pt': '',
    },
    'uo569n6k': {
      'en': 'Event Address',
      'pt': '',
    },
    'y252cygb': {
      'en': 'Bride Phone number',
      'pt': '',
    },
    '7o26ahtw': {
      'en': 'Planner\'s Phone number',
      'pt': '',
    },
    'ktxdwe5l': {
      'en': 'Note',
      'pt': '',
    },
    'nabz6zp9': {
      'en': 'Option 1',
      'pt': '',
    },
    'zn3fbltb': {
      'en': 'Select event types',
      'pt': '',
    },
    'wyzlo95j': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'i1oezujq': {
      'en': 'Option 1',
      'pt': '',
    },
    'e4frp46m': {
      'en': 'Select Services',
      'pt': '',
    },
    'cjz8edj4': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'espm5o0w': {
      'en': 'Option 1',
      'pt': '',
    },
    'g4knyav3': {
      'en': 'Select Artists',
      'pt': '',
    },
    'nto6qijs': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'n12rvrs4': {
      'en': 'Save',
      'pt': '',
    },
    'uomba22l': {
      'en': 'Home',
      'pt': '',
    },
  },
  // ArtistFilter
  {
    's3hw32c4': {
      'en': 'Artist Filter',
      'pt': '',
    },
    '9sl9u6dx': {
      'en': 'Option 1',
      'pt': '',
    },
    '43h8la8w': {
      'en': 'Select Artists',
      'pt': '',
    },
    'ovc8c18v': {
      'en': 'Search for an item...',
      'pt': '',
    },
    'k7dmszpv': {
      'en': 'Save',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    '96xl7any': {
      'en': '',
      'pt': '',
    },
    'undrp3x8': {
      'en': '',
      'pt': '',
    },
    'qxwm5ije': {
      'en': 'Allow the app to access your Location',
      'pt': '',
    },
    '7tu07irj': {
      'en': 'Allow the app to send you Notifications',
      'pt': '',
    },
    '3wrokjou': {
      'en': 'Allow the app to access your Photo Library',
      'pt': '',
    },
    'xq2h9s8v': {
      'en': 'Allow the app to access your Contacts',
      'pt': '',
    },
    'ns973rt4': {
      'en': 'Allow the app to access your Calendar',
      'pt': '',
    },
    '07r0uwbs': {
      'en': 'Enter the app with TouchID or FaceID',
      'pt': '',
    },
    'jt71mcs1': {
      'en': '',
      'pt': '',
    },
    't8iw6w0t': {
      'en': '',
      'pt': '',
    },
    'lmog0ori': {
      'en': '',
      'pt': '',
    },
    'pbi3q4cs': {
      'en': '',
      'pt': '',
    },
    '4rqqd14o': {
      'en': '',
      'pt': '',
    },
    '39sqsgu2': {
      'en': '',
      'pt': '',
    },
    '20txjcef': {
      'en': '',
      'pt': '',
    },
    '17zaouxa': {
      'en': '',
      'pt': '',
    },
    'inomk74o': {
      'en': '',
      'pt': '',
    },
    'u2zdpxgo': {
      'en': '',
      'pt': '',
    },
    'xcsn178b': {
      'en': '',
      'pt': '',
    },
    'olf4pzge': {
      'en': '',
      'pt': '',
    },
    '4siqvvbb': {
      'en': '',
      'pt': '',
    },
    'qmqy9jz9': {
      'en': '',
      'pt': '',
    },
    '5cpagaqo': {
      'en': '',
      'pt': '',
    },
    '5nwjo997': {
      'en': '',
      'pt': '',
    },
    'yo267pke': {
      'en': '',
      'pt': '',
    },
    'dpo4jjzb': {
      'en': '',
      'pt': '',
    },
    'mqij666m': {
      'en': '',
      'pt': '',
    },
    'cxuuibaq': {
      'en': '',
      'pt': '',
    },
    'vv8opjhg': {
      'en': '',
      'pt': '',
    },
    'smluauou': {
      'en': '',
      'pt': '',
    },
    'tokoegre': {
      'en': '',
      'pt': '',
    },
    '8qzrt3sf': {
      'en': '',
      'pt': '',
    },
    'n5vbzyfi': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
