import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'kn', 'hi'];

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
    String? knText = '',
    String? hiText = '',
  }) =>
      [enText, knText, hiText][languageIndex] ?? '';

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
  // loginpage
  {
    'lo7746r6': {
      'en': 'Welcome back',
      'hi': 'वापसी पर स्वागत है',
      'kn': 'ಮರಳಿ ಸ್ವಾಗತ',
    },
    'wt7nzu4m': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    '9tzz83ma': {
      'en': 'Enter your email and password',
      'hi': 'अपना ईमेल और पासवर्ड दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ',
    },
    '3ikcqh84': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    'anlbltr4': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'hv5pe3cz': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    '1vo3dusy': {
      'en': 'Sign up',
      'hi': 'साइन अप करें',
      'kn': 'ಸೈನ್ ಅಪ್ ಮಾಡಿ',
    },
    'wkjbt6bm': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
    },
  },
  // forgetpassword
  {
    'ki2dqdyq': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ',
    },
    'gdaxi4ff': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    'qcrjx9p7': {
      'en': 'Enter your email',
      'hi': 'अपना ईमेल दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ನಮೂದಿಸಿ',
    },
    'vrdfme6z': {
      'en': 'Proceed',
      'hi': 'आगे बढ़ना',
      'kn': 'ಮುಂದುವರೆಯಲು',
    },
  },
  // Homepage
  {
    'knvkqn7z': {
      'en': 'Hello ',
      'hi': 'नमस्ते',
      'kn': 'ನಮಸ್ಕಾರ',
    },
    '6x97m7ah': {
      'en': ',',
      'hi': ',',
      'kn': ',',
    },
    '7jnd5yjn': {
      'en': 'Your Quiz',
      'hi': 'आपकी प्रश्नोत्तरी',
      'kn': 'ನಿಮ್ಮ ರಸಪ್ರಶ್ನೆ',
    },
    'gsxa3p6z': {
      'en': 'Generative Ai ',
      'hi': 'जनरेटिव ऐ',
      'kn': 'ಜನರೇಟಿವ್ ಐ',
    },
    'dfyywlef': {
      'en': 'Language',
      'hi': 'भाषा',
      'kn': 'ಭಾಷೆ',
    },
    '3tvdgoja': {
      'en': 'Log out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    'qczng989': {
      'en': '',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // settings
  {
    '51twku3b': {
      'en': 'Settings',
      'hi': 'समायोजन',
      'kn': 'ಸಂಯೋಜನೆಗಳು',
    },
    '6st8zeth': {
      'en': 'Language',
      'hi': 'भाषा',
      'kn': 'ಭಾಷೆ',
    },
    'mm9v67g1': {
      'en': 'Notification Settings',
      'hi': 'अधिसूचना सेटिंग्स',
      'kn': 'ಅಧಿಸೂಚನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
    },
    '4bgsgs9k': {
      'en': 'Log out of account',
      'hi': 'खाते से लॉग आउट करें',
      'kn': 'ಖಾತೆಯಿಂದ ಲಾಗ್ ಔಟ್ ಮಾಡಿ',
    },
    's6nhcpfe': {
      'en': 'Log Out?',
      'hi': 'लॉग आउट?',
      'kn': 'ಲಾಗ್ ಔಟ್?',
    },
    '367osrbd': {
      'en': 'Settings',
      'hi': 'समायोजन',
      'kn': 'ಸಂಯೋಜನೆಗಳು',
    },
    '5w253p7k': {
      'en': '',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // Quizpage
  {
    'hpfd0aav': {
      'en': 'Q',
      'hi': 'क्यू',
      'kn': 'ಪ್ರ',
    },
    'b19hkj2c': {
      'en': 'Next',
      'hi': 'अगला',
      'kn': 'ಮುಂದೆ',
    },
    'uiv6vddv': {
      'en': 'Completed',
      'hi': 'पुरा होना।',
      'kn': 'ಪೂರ್ಣಗೊಂಡಿದೆ',
    },
    'i0wg0we1': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // Scorepage
  {
    '52bj1pzp': {
      'en': 'Congratulation',
      'hi': 'बधाई',
      'kn': 'ಅಭಿನಂದನೆಗಳು',
    },
    'x9nvylyy': {
      'en': 'You have got ',
      'hi': 'तुम्हें मिल गया है',
      'kn': 'ನಿಮಗೆ ಸಿಕ್ಕಿದೆ',
    },
    '4qeqi980': {
      'en': ' points',
      'hi': 'अंक',
      'kn': 'ಅಂಕಗಳು',
    },
    'wgkqatbk': {
      'en': 'share your score',
      'hi': 'अपना स्कोर साझा करें',
      'kn': 'ನಿಮ್ಮ ಸ್ಕೋರ್ ಹಂಚಿಕೊಳ್ಳಿ',
    },
    'qzjvft0r': {
      'en': ' out of ',
      'hi': 'से बाहर',
      'kn': 'ಹೊರಗೆ',
    },
    '1rbm10db': {
      'en': ' correct',
      'hi': 'सही',
      'kn': 'ಸರಿಯಾದ',
    },
    'qhhifqrp': {
      'en': 'For Any Queries',
      'hi': 'किसी भी प्रश्न के लिए',
      'kn': 'ಯಾವುದೇ ಪ್ರಶ್ನೆಗಳಿಗೆ',
    },
    'q9zl4v8r': {
      'en': 'info@thekalieducation.com',
      'hi': 'info@the Kalieducation.com',
      'kn': 'info@thekalieducation.com',
    },
    '1lpfsnej': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // createquizsets
  {
    '3yld5ebq': {
      'en': 'add cover photo',
      'hi': 'कवर फ़ोटो जोड़ें',
      'kn': 'ಕವರ್ ಫೋಟೋ ಸೇರಿಸಿ',
    },
    'f52x3i7o': {
      'en': 'Title',
      'hi': 'शीर्षक',
      'kn': 'ಶೀರ್ಷಿಕೆ',
    },
    '35600e8s': {
      'en': 'enter title',
      'hi': 'शीर्षक दर्ज करें',
      'kn': 'ಶೀರ್ಷಿಕೆ ನಮೂದಿಸಿ',
    },
    'nxn2j94f': {
      'en': 'descrption',
      'hi': 'विवरण',
      'kn': 'ವಿವರಣೆ',
    },
    'ybbear1r': {
      'en': 'enter descrption',
      'hi': 'विवरण दर्ज करें',
      'kn': 'ವಿವರಣೆಯನ್ನು ನಮೂದಿಸಿ',
    },
    'ifebqn0m': {
      'en': 'duration',
      'hi': 'अवधि',
      'kn': 'ಅವಧಿ',
    },
    'w6brxvhs': {
      'en': 'enter duration',
      'hi': 'अवधि दर्ज करें',
      'kn': 'ಅವಧಿಯನ್ನು ನಮೂದಿಸಿ',
    },
    '6hwxpc9z': {
      'en': 'no.of.quiz',
      'hi': 'प्रश्नोत्तरी की संख्या',
      'kn': 'ರಸಪ್ರಶ್ನೆ ಸಂಖ್ಯೆ',
    },
    '825qfcf9': {
      'en': 'enter duration',
      'hi': 'अवधि दर्ज करें',
      'kn': 'ಅವಧಿಯನ್ನು ನಮೂದಿಸಿ',
    },
    'dbs2j4r3': {
      'en': 'create set',
      'hi': 'सेट बनाएं',
      'kn': 'ಸೆಟ್ ರಚಿಸಿ',
    },
    'h6dd4diq': {
      'en': 'created sets',
      'hi': 'सेट बनाए गए',
      'kn': 'ಸೆಟ್ಗಳನ್ನು ರಚಿಸಲಾಗಿದೆ',
    },
    '27ah4oyb': {
      'en': 'create set',
      'hi': 'सेट बनाएं',
      'kn': 'ಸೆಟ್ ರಚಿಸಿ',
    },
    '07bf20a5': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // addquiz
  {
    'hbyfrinu': {
      'en': 'write question',
      'hi': 'सवाल लिखो',
      'kn': 'ಪ್ರಶ್ನೆ ಬರೆಯಿರಿ',
    },
    'mdf9pbla': {
      'en': 'option (a)',
      'hi': 'विकल्प (ए)',
      'kn': 'ಆಯ್ಕೆ (ಎ)',
    },
    '2gzqwzam': {
      'en': 'option (b)',
      'hi': 'विकल्प (बी)',
      'kn': 'ಆಯ್ಕೆ (ಬಿ)',
    },
    'vxfwv4r9': {
      'en': 'option (c)',
      'hi': 'विकल्प (सी)',
      'kn': 'ಆಯ್ಕೆ (ಸಿ)',
    },
    'oxaiz856': {
      'en': 'option (d)',
      'hi': 'विकल्प (डी)',
      'kn': 'ಆಯ್ಕೆ (ಡಿ)',
    },
    'c1n7k41h': {
      'en': 'add question',
      'hi': 'प्रश्न जोड़ें',
      'kn': 'ಪ್ರಶ್ನೆಯನ್ನು ಸೇರಿಸಿ',
    },
    '5qd7ze6s': {
      'en': 'add quiz',
      'hi': 'प्रश्नोत्तरी जोड़ें',
      'kn': 'ರಸಪ್ರಶ್ನೆ ಸೇರಿಸಿ',
    },
    'wqwq9dse': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // signupp
  {
    'bgvasy2r': {
      'en': 'Join us & learn amazingly',
      'hi': 'हमसे जुड़ें और आश्चर्यजनक रूप से सीखें',
      'kn': 'ನಮ್ಮೊಂದಿಗೆ ಸೇರಿ ಮತ್ತು ಅದ್ಭುತವಾಗಿ ಕಲಿಯಿರಿ',
    },
    'keulr30h': {
      'en': 'Display Name',
      'hi': 'प्रदर्शित होने वाला नाम',
      'kn': 'ಪ್ರದರ್ಶನ ಹೆಸರು',
    },
    'woy79l1n': {
      'en': 'Enter your name',
      'hi': '',
      'kn': '',
    },
    '75ia9uxq': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    'ypbgr5od': {
      'en': 'Enter you mail',
      'hi': '',
      'kn': '',
    },
    '109r28j9': {
      'en': 'phone number',
      'hi': 'फ़ोन नंबर',
      'kn': 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ',
    },
    '8847hctf': {
      'en': '+91',
      'hi': '',
      'kn': '',
    },
    '364utgl6': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    '268xgkio': {
      'en': 'confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    'wu2vrrm7': {
      'en': 'I Agree to Terms & condition of Kali',
      'hi': 'मैं काली के नियमों और शर्तों से सहमत हूं',
      'kn': 'ನಾನು ಕಾಲಿಯ ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳಿಗೆ ಸಮ್ಮತಿಸುತ್ತೇನೆ',
    },
    'ang9o9rh': {
      'en': 'I would like to receive inspriation emails.',
      'hi': 'मैं प्रेरणा ईमेल प्राप्त करना चाहूँगा.',
      'kn': 'ನಾನು ಪ್ರೇರಣೆ ಇಮೇಲ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ಬಯಸುತ್ತೇನೆ.',
    },
    'q6lmwxh8': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
    },
    '3mlvr8i2': {
      'en': 'Back',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
    },
    'zg1dj4ko': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // feeback
  {
    'ocaiv9vd': {
      'en': 'Name',
      'hi': 'नाम',
      'kn': 'ಹೆಸರು',
    },
    '7yco3qik': {
      'en': 'email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    'cvarp27y': {
      'en': 'Message',
      'hi': 'संदेश',
      'kn': 'ಸಂದೇಶ',
    },
    'sqn3ejrl': {
      'en': 'Enter your message',
      'hi': 'अपना संदेश दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಸಂದೇಶವನ್ನು ನಮೂದಿಸಿ',
    },
    '1re29pmc': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
    },
    '0lzci5aa': {
      'en': 'Thanks for your valuable time',
      'hi': 'आपके बहुमूल्य समय के लिए धन्यवाद',
      'kn': 'ನಿಮ್ಮ ಅಮೂಲ್ಯ ಸಮಯಕ್ಕೆ ಧನ್ಯವಾದಗಳು',
    },
  },
  // scorerevealing
  {
    '0cls83le': {
      'en': 'Answers',
      'hi': 'जवाब',
      'kn': 'ಉತ್ತರಗಳು',
    },
    '2p4fxe8o': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // Aiintroduction
  {
    'o4goejty': {
      'en': 'Machine learning',
      'hi': 'यंत्र अधिगम',
      'kn': 'ಯಂತ್ರ ಕಲಿಕೆ',
    },
    'i7rnzskt': {
      'en':
          '\"Empower education with our inbuilt ML-trained model, seamlessly integrated into our app. Enhance learning experiences, provide personalized insights, and revolutionize the way students engage with educational content.\"\n',
      'hi':
          '\"हमारे इनबिल्ट एमएल-प्रशिक्षित मॉडल के साथ शिक्षा को सशक्त बनाएं, जो हमारे ऐप में सहजता से एकीकृत है। सीखने के अनुभवों को बढ़ाएं, वैयक्तिकृत अंतर्दृष्टि प्रदान करें, और छात्रों के शैक्षिक सामग्री के साथ जुड़ने के तरीके में क्रांतिकारी बदलाव लाएं।\"',
      'kn':
          '\"ನಮ್ಮ ಅಂತರ್ಗತ ML-ತರಬೇತಿ ಪಡೆದ ಮಾದರಿಯೊಂದಿಗೆ ಶಿಕ್ಷಣವನ್ನು ಸಬಲಗೊಳಿಸಿ, ನಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಮನಬಂದಂತೆ ಸಂಯೋಜಿಸಲಾಗಿದೆ. ಕಲಿಕೆಯ ಅನುಭವಗಳನ್ನು ವರ್ಧಿಸಿ, ವೈಯಕ್ತೀಕರಿಸಿದ ಒಳನೋಟಗಳನ್ನು ಒದಗಿಸಿ ಮತ್ತು ಶೈಕ್ಷಣಿಕ ವಿಷಯದೊಂದಿಗೆ ವಿದ್ಯಾರ್ಥಿಗಳು ತೊಡಗಿಸಿಕೊಳ್ಳುವ ರೀತಿಯಲ್ಲಿ ಕ್ರಾಂತಿಕಾರಿಗೊಳಿಸಿ.\"',
    },
    'v3xdqvs5': {
      'en': 'Image Detection',
      'hi': 'छवि का पता लगाना',
      'kn': 'ಚಿತ್ರ ಪತ್ತೆ',
    },
    '19yv753w': {
      'en':
          '\"Elevate education with our inbuilt ML image detection model within the app. Enable students to explore and learn from the visual world, fostering a deeper understanding of subjects. Transforming education one image at a time.\"\n',
      'hi':
          '\"ऐप के भीतर हमारे इनबिल्ट एमएल इमेज डिटेक्शन मॉडल के साथ शिक्षा को उन्नत करें। छात्रों को दृश्य दुनिया का पता लगाने और सीखने में सक्षम बनाएं, विषयों की गहरी समझ को बढ़ावा दें। शिक्षा को एक समय में एक छवि में बदलना।\"',
      'kn':
          '\"ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನಮ್ಮ ಅಂತರ್ಗತ ML ಇಮೇಜ್ ಪತ್ತೆ ಮಾದರಿಯೊಂದಿಗೆ ಶಿಕ್ಷಣವನ್ನು ಉನ್ನತೀಕರಿಸಿ. ವಿದ್ಯಾರ್ಥಿಗಳಿಗೆ ದೃಶ್ಯ ಪ್ರಪಂಚವನ್ನು ಅನ್ವೇಷಿಸಲು ಮತ್ತು ಕಲಿಯಲು, ವಿಷಯಗಳ ಆಳವಾದ ತಿಳುವಳಿಕೆಯನ್ನು ಬೆಳೆಸಲು ಸಕ್ರಿಯಗೊಳಿಸಿ. ಶಿಕ್ಷಣವನ್ನು ಒಂದು ಸಮಯದಲ್ಲಿ ಒಂದು ಚಿತ್ರವನ್ನು ಪರಿವರ್ತಿಸುವುದು.\"',
    },
    'wpmr66x8': {
      'en': 'Next',
      'hi': 'अगला',
      'kn': 'ಮುಂದೆ',
    },
    'emwgu83y': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // CHATGPT
  {
    'gc46v8h9': {
      'en': 'Copy response',
      'hi': '',
      'kn': '',
    },
    '9mu0e49u': {
      'en': 'Type something...',
      'hi': '',
      'kn': '',
    },
    'dp0tr08m': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // asffdfs
  {
    'nizs8hwx': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // quizsets
  {
    '4d91xbys': {
      'en': ' questions',
      'hi': 'प्रशन',
      'kn': 'ಪ್ರಶ್ನೆಗಳು',
    },
    'uu0cf6ai': {
      'en': ' min',
      'hi': 'मिन',
      'kn': 'ನಿಮಿಷ',
    },
  },
  // ppppp
  {
    'oa7h9nnr': {
      'en': 'PDF',
      'hi': 'पीडीएफ',
      'kn': 'PDF',
    },
    'phoj2lm4': {
      'en': 'find answer in pdf',
      'hi': 'उत्तर पीडीएफ में खोजें',
      'kn': 'pdf ನಲ್ಲಿ ಉತ್ತರವನ್ನು ಹುಡುಕಿ',
    },
    'ygr51g17': {
      'en': 'Image',
      'hi': 'छवि',
      'kn': 'ಚಿತ್ರ',
    },
    'catktjrs': {
      'en': 'Image detection',
      'hi': 'छवि का पता लगाना',
      'kn': 'ಚಿತ್ರ ಪತ್ತೆ',
    },
    't1yhhi1p': {
      'en': 'PDF',
      'hi': 'पीडीएफ',
      'kn': 'PDF',
    },
    'z8g7y3gp': {
      'en': 'find answer in pdf',
      'hi': 'उत्तर पीडीएफ में खोजें',
      'kn': 'pdf ನಲ್ಲಿ ಉತ್ತರವನ್ನು ಹುಡುಕಿ',
    },
    '6wucmuq4': {
      'en': 'PDF',
      'hi': 'पीडीएफ',
      'kn': 'PDF',
    },
    '001aq3s8': {
      'en': 'find answer in pdf',
      'hi': 'उत्तर पीडीएफ में खोजें',
      'kn': 'pdf ನಲ್ಲಿ ಉತ್ತರವನ್ನು ಹುಡುಕಿ',
    },
  },
  // BLANK
  {
    'fx1h0lrj': {
      'en':
          'Welcome to Kali\'s Gpt , The Future of Education ! \n\n\"Empower education with our inbuilt ML-trained model, seamlessly integrated into our app. Enhance learning experiences, provide personalized insights, and revolutionize the way students engage with educational content.\"\n',
      'hi': '',
      'kn': '',
    },
  },
  // photoupload
  {
    'dy0dx7gf': {
      'en': 'Change Photo',
      'hi': '',
      'kn': '',
    },
    '83fv62ja': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'hi': '',
      'kn': '',
    },
    'jr9hq3um': {
      'en': 'Upload Image',
      'hi': '',
      'kn': '',
    },
    'sxs9zugb': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
    },
  },
  // Miscellaneous
  {
    '6mpu3h8n': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'i6k6zvzk': {
      'en': 'for uploading profile picture',
      'hi': 'प्रोफ़ाइल चित्र अपलोड करने के लिए',
      'kn': 'ಪ್ರೊಫೈಲ್ ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಲು',
    },
    'douf5q4r': {
      'en': 'we',
      'hi': 'हम',
      'kn': 'ನಾವು',
    },
    'xqx379dg': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'cpcxyxvo': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'tzb4b38k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'i9ilq18f': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'rd8mg9x4': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'hnqsyyko': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'oqndw81k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'n6idmpax': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'hmeqs4m6': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '88q7kcqt': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'cstyk8ri': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'pme5f5ma': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'leeq26l8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '8sgqpl7k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zk82wb3k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    's07gj9c8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '98anyomu': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '9l86x2bk': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'loftexyv': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'qgen1hj0': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'qsnk8qzp': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5g04hvvc': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zy6e0vq7': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
