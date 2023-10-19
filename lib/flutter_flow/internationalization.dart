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
    'u6217q6m': {
      'en': 'Sign in with Google',
      'hi': 'Google से साइन इन करें',
      'kn': 'Google ನೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ',
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
    'd5kpo191': {
      'en': 'Recent Annoncements',
      'hi': 'हाल की घोषणाएँ',
      'kn': 'ಇತ್ತೀಚಿನ ಪ್ರಕಟಣೆಗಳು',
    },
    '17enp5bz': {
      'en': 'Explore Contents',
      'hi': 'सामग्री का अन्वेषण करें',
      'kn': 'ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ',
    },
    '6vpysxlq': {
      'en': 'Popular Quiz',
      'hi': 'लोकप्रिय प्रश्नोत्तरी',
      'kn': 'ಜನಪ್ರಿಯ ರಸಪ್ರಶ್ನೆ',
    },
    'umbnyiv0': {
      'en': 'View all',
      'hi': 'सभी को देखें',
      'kn': 'ಎಲ್ಲಾ ವೀಕ್ಷಿಸಿ',
    },
    'dfyywlef': {
      'en': 'Language',
      'hi': 'भाषा',
      'kn': 'ಭಾಷೆ',
    },
    's6sxiyc4': {
      'en': 'Kali Generative',
      'hi': 'काली उत्पादक',
      'kn': 'ಕಾಳಿ ಜನರೇಟಿವ್',
    },
    'g6r1sg3q': {
      'en': 'ai',
      'hi': 'ऐ',
      'kn': 'ai',
    },
    'auak7fz6': {
      'en': 'Try now',
      'hi': 'अब कोशिश करो',
      'kn': 'ಈಗ ಪ್ರಯತ್ನಿಸಿ',
    },
    'b25qwnhs': {
      'en': 'Invite Friends',
      'hi': 'मित्रों को आमंत्रित करें',
      'kn': 'ಸ್ನೇಹಿತರನ್ನು ಆಹ್ವಾನಿಸಿ',
    },
    'nwzse2ka': {
      'en': 'Invite now',
      'hi': 'अभी आमंत्रित करें',
      'kn': 'ಈಗ ಆಹ್ವಾನಿಸಿ',
    },
    '5x8krj10': {
      'en': 'Progress',
      'hi': 'प्रगति',
      'kn': 'ಪ್ರಗತಿ',
    },
    't1wqilj1': {
      'en': 'Upgrade to Premium',
      'hi': 'प्रीमियम में अपग्रेड करें',
      'kn': 'ಪ್ರೀಮಿಯಂಗೆ ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ',
    },
    '3tvdgoja': {
      'en': 'Log out',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    't6v9vjwt': {
      'en': 'Hello ',
      'hi': 'नमस्ते',
      'kn': 'ನಮಸ್ಕಾರ',
    },
    'fohajhi7': {
      'en': ',',
      'hi': ',',
      'kn': ',',
    },
    'qczng989': {
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
  // Quizconifrmation
  {
    '518egu31': {
      'en': 'Please read the text below carefully\nso you can understand it',
      'hi': 'कृपया नीचे दिए गए पाठ को ध्यान से पढ़ें\nतो आप इसे समझ सकते हैं',
      'kn':
          'ದಯವಿಟ್ಟು ಕೆಳಗಿನ ಪಠ್ಯವನ್ನು ಎಚ್ಚರಿಕೆಯಿಂದ ಓದಿ\nಆದ್ದರಿಂದ ನೀವು ಅದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು',
    },
    'siaylvqu': {
      'en':
          '1. 50 point awarded for a correct answer and no\nmarks for a incorrect answer\n\n2. Tap on options to select the correct answer\n\n3. Click submit if you are sure you want to\ncomplete all the quizzes\n\n4. Note \" Dark Mode is Disabled ! \"',
      'hi':
          '1. सही उत्तर के लिए 50 अंक दिए गए और नहीं\nग़लत उत्तर के लिए अंक\n\n2. सही उत्तर चुनने के लिए विकल्पों पर टैप करें\n\n3. यदि आप सुनिश्चित हैं कि आप सबमिट करना चाहते हैं तो सबमिट पर क्लिक करें\nसभी प्रश्नोत्तरी पूरी करें\n\n4. नोट \"डार्क मोड अक्षम है!\"',
      'kn':
          '1. ಸರಿಯಾದ ಉತ್ತರಕ್ಕಾಗಿ 50 ಅಂಕಗಳನ್ನು ನೀಡಲಾಗುತ್ತದೆ ಮತ್ತು ಇಲ್ಲ\nತಪ್ಪಾದ ಉತ್ತರಕ್ಕೆ ಅಂಕಗಳು\n\n2. ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಆಯ್ಕೆಗಳ ಮೇಲೆ ಟ್ಯಾಪ್ ಮಾಡಿ\n\n3. ನೀವು ಖಚಿತವಾಗಿ ಬಯಸಿದರೆ ಸಲ್ಲಿಸು ಕ್ಲಿಕ್ ಮಾಡಿ\nಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ\n\n4. ಗಮನಿಸಿ \"ಡಾರ್ಕ್ ಮೋಡ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ!\"',
    },
    'pbwlks8a': {
      'en': 'Take Test',
      'hi': 'परीक्षा लो',
      'kn': 'ಪರೀಕ್ಷೆ ತೆಗೆದುಕೊಳ್ಳಿ',
    },
    'rk15ubrv': {
      'en': 'Test Confirmation',
      'hi': 'परीक्षण पुष्टिकरण',
      'kn': 'ಪರೀಕ್ಷಾ ದೃಢೀಕರಣ',
    },
    'dvqzp3cd': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // signupnew
  {
    'c238dzv3': {
      'en': 'Create an account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆಯನ್ನು ತೆರೆಯಿರಿ',
    },
    'chs4lv52': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
    },
    'rnfshx5e': {
      'en': 'Display Name',
      'hi': 'प्रदर्शित होने वाला नाम',
      'kn': 'ಪ್ರದರ್ಶನ ಹೆಸರು',
    },
    '1kwpzor9': {
      'en': 'Email',
      'hi': 'ईमेल',
      'kn': 'ಇಮೇಲ್',
    },
    'i6m52ocf': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'xopwflmb': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    'ocvgf4pz': {
      'en': 'Upload image',
      'hi': 'तस्विर अपलोड करना',
      'kn': 'ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ',
    },
    'q645225b': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆ ತೆರೆ',
    },
    'rkl58r74': {
      'en': 'Already have an account?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆ ಹೊಂದಿದ್ದೀರ?',
    },
    'onqcmpx2': {
      'en': 'Sign In Here',
      'hi': 'यहां साइन इन करो',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ',
    },
    '65ni109p': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ?',
    },
  },
  // score
  {
    '9e7cp4vi': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // welcomegpt
  {
    'pb4nvxlk': {
      'en': 'Kali Generative',
      'hi': 'काली उत्पादक',
      'kn': 'ಕಾಳಿ ಜನರೇಟಿವ್',
    },
    'rbmbfzku': {
      'en': 'ai',
      'hi': 'ऐ',
      'kn': 'ai',
    },
    '1onwf350': {
      'en': 'How can I help you today?',
      'hi': 'आज मैं आपकी मदद करने में कैसे सक्षम हूं?',
      'kn': 'ಇಂದು ನಾನು ನಿಮಗೆ ಹೇಗೆ ಸಹಾಯ ಮಾಡಬಹುದು?',
    },
    'bn71omq8': {
      'en': 'hello Ask me anything...',
      'hi': 'नमस्ते मुझसे कुछ भी पूछो...',
      'kn': 'ಹಲೋ ಏನಾದ್ರೂ ಕೇಳು...',
    },
    'md02n0lp': {
      'en': 'Upgrade to Premium',
      'hi': 'प्रीमियम में अपग्रेड करें',
      'kn': 'ಪ್ರೀಮಿಯಂಗೆ ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ',
    },
    '4u9t0914': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // gptpage
  {
    '47tt1ir6': {
      'en': 'Welcome chief',
      'hi': 'स्वागत है मुखिया जी',
      'kn': 'ಮುಖ್ಯಸ್ಥ ಸ್ವಾಗತಿಸಿದರು',
    },
    '30uisgh9': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'ndk4706m': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'cs4d0fay': {
      'en': 'Ask me anything...',
      'hi': 'मुझसे कुछ भी पूछें...',
      'kn': 'ನನ್ನನ್ನು ಎನಾದರು ಕೇಳು...',
    },
    '0g97m6uw': {
      'en': 'New Chat',
      'hi': 'नई चैट',
      'kn': 'ಹೊಸ ಚಾಟ್',
    },
    'qoq8dclu': {
      'en': 'Past Chats',
      'hi': 'पिछली चैट',
      'kn': 'ಹಿಂದಿನ ಚಾಟ್‌ಗಳು',
    },
    '95jlzi0y': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // tiktikkkkk
  {
    'molnturs': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // Details36ArticleDetails
  {
    '0y3jy12a': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // OnboardingPage
  {
    '56yde4a2': {
      'en': 'Setting up ',
      'hi': '',
      'kn': '',
    },
    'a2sxp184': {
      'en': 'Welcome to the Future Education !',
      'hi': '',
      'kn': '',
    },
    'c81nn4e7': {
      'en': 'Future Education',
      'hi': '',
      'kn': '',
    },
    'nbfij2dk': {
      'en':
          'With an inbuilt artificial intelligence and cutting-edge predictive machine learning models, ',
      'hi': '',
      'kn': '',
    },
    'ehon31qa': {
      'en': 'Done',
      'hi': '',
      'kn': '',
    },
    '6rkbt4ab': {
      'en': 'Sign up to join New era of Education',
      'hi': '',
      'kn': '',
    },
    'a7i5ujub': {
      'en': 'Join Now',
      'hi': '',
      'kn': '',
    },
    '00df9kdj': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // quizsets
  {
    'uxb4rk9x': {
      'en': ' Questions',
      'hi': 'प्रशन',
      'kn': 'ಪ್ರಶ್ನೆಗಳು',
    },
    'brogtioz': {
      'en': ' Mins',
      'hi': 'मिनट',
      'kn': 'ನಿಮಿಷಗಳು',
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
      'hi':
          'काली के जीपीटी, शिक्षा का भविष्य में आपका स्वागत है!\n\n\"हमारे इनबिल्ट एमएल-प्रशिक्षित मॉडल के साथ शिक्षा को सशक्त बनाएं, जो हमारे ऐप में सहजता से एकीकृत है। सीखने के अनुभवों को बढ़ाएं, वैयक्तिकृत अंतर्दृष्टि प्रदान करें, और छात्रों के शैक्षिक सामग्री के साथ जुड़ने के तरीके में क्रांतिकारी बदलाव लाएं।\"',
      'kn':
          'ಕಾಲಿಯ Gpt ಗೆ ಸುಸ್ವಾಗತ , ಶಿಕ್ಷಣದ ಭವಿಷ್ಯ !\n\n\"ನಮ್ಮ ಅಂತರ್ಗತ ML-ತರಬೇತಿ ಪಡೆದ ಮಾದರಿಯೊಂದಿಗೆ ಶಿಕ್ಷಣವನ್ನು ಸಬಲಗೊಳಿಸಿ, ನಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಮನಬಂದಂತೆ ಸಂಯೋಜಿಸಲಾಗಿದೆ. ಕಲಿಕೆಯ ಅನುಭವಗಳನ್ನು ವರ್ಧಿಸಿ, ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಒಳನೋಟಗಳನ್ನು ಒದಗಿಸಿ ಮತ್ತು ವಿದ್ಯಾರ್ಥಿಗಳು ಶೈಕ್ಷಣಿಕ ವಿಷಯದೊಂದಿಗೆ ತೊಡಗಿಸಿಕೊಳ್ಳುವ ರೀತಿಯಲ್ಲಿ ಕ್ರಾಂತಿಕಾರಿಗೊಳಿಸಿ.\"',
    },
  },
  // photoupload
  {
    'dy0dx7gf': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'kn': 'ಫೋಟೋ ಬದಲಾಯಿಸಿ',
    },
    '83fv62ja': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'hi':
          'दूसरों द्वारा देखे गए अपने अवतार को बदलने के लिए नीचे एक नई फ़ोटो अपलोड करें।',
      'kn':
          'ಇತರರು ನೋಡಿದ ನಿಮ್ಮ ಅವತಾರವನ್ನು ಬದಲಾಯಿಸಲು ಕೆಳಗೆ ಹೊಸ ಫೋಟೋವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ.',
    },
    'jr9hq3um': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'kn': 'ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ',
    },
    'sxs9zugb': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'kn': 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸು',
    },
  },
  // Preeeeeee
  {
    'gwb7mv6t': {
      'en': 'Later',
      'hi': 'बाद में',
      'kn': 'ನಂತರ',
    },
    'zla1wlx7': {
      'en': 'Upgrade to PRO',
      'hi': 'प्रो में अपग्रेड',
      'kn': 'ಪ್ರೊಗೆ ಅಪ್ಗ್ರೇಡ್ ಮಾಡಿ',
    },
    'wcvhbq7q': {
      'en': 'Upgrade to remove ads, unlimited access all Quiz',
      'hi': 'विज्ञापन हटाने के लिए अपग्रेड करें, सभी क्विज़ तक असीमित पहुंच',
      'kn':
          'ಜಾಹೀರಾತುಗಳನ್ನು ತೆಗೆದುಹಾಕಲು ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ, ಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗೆ ಅನಿಯಮಿತ ಪ್ರವೇಶ',
    },
    'd6wxha0a': {
      'en': 'Upgrade',
      'hi': 'उन्नत करना',
      'kn': 'ನವೀಕರಿಸಿ',
    },
  },
  // qUIZCONF
  {
    '773kh3kb': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'w9c7txs4': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
  },
  // Confirm
  {
    'boxrhhta': {
      'en': ' questions',
      'hi': 'प्रशन',
      'kn': 'ಪ್ರಶ್ನೆಗಳು',
    },
    '0qsoh1e9': {
      'en': ' min',
      'hi': 'मिन',
      'kn': 'ನಿಮಿಷ',
    },
  },
  // scoreticket
  {
    '2re7rakf': {
      'en': 'Score Card',
      'hi': 'स्कोर कार्ड',
      'kn': 'ಸ್ಕೋರ್ ಕಾರ್ಡ್',
    },
    'c3f0fqn7': {
      'en': 'Tap to see Answers',
      'hi': '',
      'kn': '',
    },
    'nr2t5d98': {
      'en': 'Upgrade to Premium',
      'hi': '',
      'kn': '',
    },
    'l0sm3sl8': {
      'en': 'Return to home',
      'hi': '',
      'kn': '',
    },
    '8hr5jv09': {
      'en': 'Score',
      'hi': 'अंक',
      'kn': 'ಸ್ಕೋರ್',
    },
    'fc5g1jd7': {
      'en': '---------',
      'hi': '---------',
      'kn': '-------',
    },
  },
  // aiiiiii
  {
    'xb89n8zn': {
      'en': 'Kali generative',
      'hi': 'काली उत्पादक',
      'kn': 'ಕಾಳಿ ಉತ್ಪಾದಕ',
    },
    'ibnyx58z': {
      'en': 'ai',
      'hi': 'ऐ',
      'kn': 'ai',
    },
    'boxsjdb8': {
      'en': 'GPT powered ',
      'hi': 'जीपीटी संचालित',
      'kn': 'GPT ಚಾಲಿತ',
    },
    'yhz1jid2': {
      'en': 'Try now',
      'hi': 'Try now',
      'kn': 'Try now',
    },
  },
  // sliderThumb
  {
    'un8hvnch': {
      'en': 'Join us',
      'hi': '',
      'kn': '',
    },
  },
  // slideThumb
  {
    'zalzu4e3': {
      'en': 'slide to\nride',
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
