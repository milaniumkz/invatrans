import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'kk'];

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
    String? ruText = '',
    String? kkText = '',
  }) =>
      [ruText, kkText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'foivvaxa': {
      'ru': 'Вход',
      'kk': '',
    },
    'oiw0u2ky': {
      'ru': 'Email',
      'kk': '',
    },
    'dfmq76pn': {
      'ru': 'Пароль',
      'kk': '',
    },
    'r7cskwr3': {
      'ru': 'Войти',
      'kk': '',
    },
    'pbhuw6na': {
      'ru': 'Забыли пароль?',
      'kk': '',
    },
    '2qa40pb7': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // Home
  {
    'pkq8jjql': {
      'ru': 'Пользователей',
      'kk': '',
    },
    'hn5st68a': {
      'ru': 'Водители',
      'kk': '',
    },
    'a56bbnjj': {
      'ru': 'Пользователи',
      'kk': '',
    },
    '6bj8vsms': {
      'ru': 'Водители',
      'kk': '',
    },
    'd4ng5b07': {
      'ru': 'Города',
      'kk': '',
    },
    'prsuot4o': {
      'ru': 'Категории услуг',
      'kk': '',
    },
    'of2sgo2o': {
      'ru': 'АВТО',
      'kk': '',
    },
    'yzgt3twn': {
      'ru': 'Политика',
      'kk': '',
    },
    'di0j92xm': {
      'ru': 'Условия',
      'kk': '',
    },
    'lkqlzq7e': {
      'ru': 'О нас',
      'kk': '',
    },
    'rn030l4o': {
      'ru': 'Тарифы',
      'kk': '',
    },
    'fj5vd04d': {
      'ru': 'чат',
      'kk': '',
    },
    'loks2r58': {
      'ru': 'Словарь',
      'kk': '',
    },
    '47j48a8s': {
      'ru': 'Жалобы',
      'kk': '',
    },
    'pqwhlhoa': {
      'ru': 'Заведения',
      'kk': '',
    },
    'fowgb1mx': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // users
  {
    '14eqcsid': {
      'ru': 'Пользователи',
      'kk': '',
    },
    '5hgu4dmb': {
      'ru': 'Удалить',
      'kk': '',
    },
    'p5pjntd0': {
      'ru': 'Админ',
      'kk': '',
    },
    'osl1x965': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // AllChatsPage
  {
    '6pd6e3ma': {
      'ru': 'Чаты',
      'kk': '',
    },
  },
  // politika
  {
    't1l396zy': {
      'ru': 'политика',
      'kk': '',
    },
    'osnjn6yo': {
      'ru': 'политика ',
      'kk': '',
    },
    'kvcokv17': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'ddwaavgx': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // uslovia
  {
    'v2uf4pvf': {
      'ru': 'Условия',
      'kk': '',
    },
    '063s9hvp': {
      'ru': 'Условия',
      'kk': '',
    },
    'komcx08c': {
      'ru': 'Сохранить',
      'kk': '',
    },
    '67rhvqlk': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // about
  {
    '618d72fd': {
      'ru': 'О нас',
      'kk': '',
    },
    'h6iohodv': {
      'ru': 'О нас',
      'kk': '',
    },
    'k05hzwey': {
      'ru': 'Сохранить',
      'kk': '',
    },
    '0gjkd1u9': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // tarif
  {
    'f4c3cb7m': {
      'ru': 'Тариф',
      'kk': '',
    },
    '0817bu33': {
      'ru': 'Коммисия Такси в %',
      'kk': '',
    },
    'iue44mhb': {
      'ru': 'Цена',
      'kk': '',
    },
    'z2q2x8ov': {
      'ru': 'Коммисия межгород',
      'kk': '',
    },
    '27igs15e': {
      'ru': 'Цена',
      'kk': '',
    },
    '6bg3bsvp': {
      'ru': 'Коммисия Услуги',
      'kk': '',
    },
    '1jcnabuw': {
      'ru': 'Цена',
      'kk': '',
    },
    'aal7c78f': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'r8z4z6s2': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // city
  {
    '2nk8wyez': {
      'ru': 'Города',
      'kk': '',
    },
    'nl2rnjxv': {
      'ru': 'Регионы',
      'kk': '',
    },
    'bi6et7ap': {
      'ru': 'Наименование',
      'kk': '',
    },
    '84wdkhw8': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'xui75cma': {
      'ru': 'Города',
      'kk': '',
    },
    'lwfqxalr': {
      'ru': 'Наименование',
      'kk': '',
    },
    'w3m817sd': {
      'ru': 'Выберите регион',
      'kk': '',
    },
    '2v09xp0i': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'rqdlfbva': {
      'ru': 'Option 1',
      'kk': '',
    },
    'fjds1zac': {
      'ru': 'Сохранить',
      'kk': '',
    },
    '9dhzqda1': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // kat
  {
    'y2w1rj9c': {
      'ru': 'Категории',
      'kk': '',
    },
    'gjovl2as': {
      'ru': 'Категории',
      'kk': '',
    },
    'tlla3x05': {
      'ru': 'Наименование',
      'kk': '',
    },
    'mehh1t81': {
      'ru': 'Выбрать иконку',
      'kk': '',
    },
    '04okmqat': {
      'ru': 'Сохранить',
      'kk': '',
    },
    's97iqasz': {
      'ru': 'Подкатегории',
      'kk': '',
    },
    '6gsa0y16': {
      'ru': 'Наименование',
      'kk': '',
    },
    'h39cojuu': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'z86043jk': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'einb7ib2': {
      'ru': 'Option 1',
      'kk': '',
    },
    '2bjj7z6s': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'tywg9p45': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // slovar
  {
    '02frl91o': {
      'ru': 'Словарь',
      'kk': '',
    },
    'yohrmxpf': {
      'ru': 'Наименование',
      'kk': '',
    },
    'eyqx1kkc': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'g1ee5wyr': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // disput
  {
    'g9baidxd': {
      'ru': 'Удалить Водителя',
      'kk': '',
    },
    'du9a9ahx': {
      'ru': 'Удалить Жалобу',
      'kk': '',
    },
    'jbhhkvyp': {
      'ru': 'Жалобы',
      'kk': '',
    },
    'p2ccv1hx': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // Avto
  {
    'w4133v00': {
      'ru': 'АВТО',
      'kk': '',
    },
    't9m7q7fn': {
      'ru': 'Марки',
      'kk': '',
    },
    'lwdi557r': {
      'ru': 'Наименование',
      'kk': '',
    },
    '5hre1t6c': {
      'ru': 'Сохранить',
      'kk': '',
    },
    '9qho2h5d': {
      'ru': 'Модель',
      'kk': '',
    },
    'acq0q25j': {
      'ru': 'Наименование',
      'kk': '',
    },
    'phrkiqt3': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'zcjr8x7h': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    '8ezzxdcp': {
      'ru': 'Option 1',
      'kk': '',
    },
    '1eav9hbj': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'rreifc9s': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // driver
  {
    'n48mvp72': {
      'ru': 'Водители',
      'kk': '',
    },
    'yeh1nmgx': {
      'ru': 'Удалить',
      'kk': '',
    },
    'bjb8oci3': {
      'ru': 'Админ',
      'kk': '',
    },
    'nfsbocnu': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // zav
  {
    'o3w2pm2w': {
      'ru': 'Заведения',
      'kk': '',
    },
    '918qecg6': {
      'ru': 'Удалить',
      'kk': '',
    },
    '5cch9t2e': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // podZav
  {
    'yo0gaxha': {
      'ru': 'Удалить',
      'kk': '',
    },
    'njzqo666': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // addZavMenu
  {
    '9uuazukg': {
      'ru': 'Новое блюдо',
      'kk': '',
    },
    '5cp6ynsw': {
      'ru': 'Выбрать фото',
      'kk': '',
    },
    'igmqu1s3': {
      'ru': 'Наименование',
      'kk': '',
    },
    'xtf66zhn': {
      'ru': 'Цена',
      'kk': '',
    },
    '6fxanj28': {
      'ru': 'Описание',
      'kk': '',
    },
    '8ilcx51i': {
      'ru': 'Добавить',
      'kk': '',
    },
    'jvkubams': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // addZav
  {
    'ic6drh1o': {
      'ru': 'Page Title',
      'kk': '',
    },
    'iialn5jd': {
      'ru': 'Выбрать фото',
      'kk': '',
    },
    'kfkv6qaj': {
      'ru': 'Наименование',
      'kk': '',
    },
    '1pi1hdbh': {
      'ru': 'Описание',
      'kk': '',
    },
    'cxkeeqcq': {
      'ru': 'Средний чек',
      'kk': '',
    },
    'lcyoeqyr': {
      'ru': 'Примерное время доставки',
      'kk': '',
    },
    'g5sidi3s': {
      'ru': 'Выберите город',
      'kk': '',
    },
    'j58aobfu': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'hwluombi': {
      'ru': 'Понедельник',
      'kk': '',
    },
    'goj3da5a': {
      'ru': 'Вторник',
      'kk': '',
    },
    'x4yuzmy8': {
      'ru': 'Среда',
      'kk': '',
    },
    'phr8csy9': {
      'ru': 'Четверг',
      'kk': '',
    },
    '6nqio4v4': {
      'ru': 'Пятница',
      'kk': '',
    },
    '37e8o6ou': {
      'ru': 'Суббота',
      'kk': '',
    },
    'it4kvytl': {
      'ru': 'Воскресенье',
      'kk': '',
    },
    'hp9gllrz': {
      'ru': 'Добавить',
      'kk': '',
    },
    '9y4ov60i': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    'cff2am1g': {
      'ru': 'photo profile and order',
      'kk': 'фото профиль және тапсырыс',
    },
    'zybv8d3e': {
      'ru': 'photo profile and order',
      'kk': 'фото профиль және тапсырыс',
    },
    'rolmlysj': {
      'ru': 'call Video',
      'kk': 'бейне қоңырау',
    },
    '1h45r712': {
      'ru': 'Ошибка',
      'kk': 'Қате',
    },
    'cc7levff': {
      'ru': 'Неверный пароль',
      'kk': 'қате құпия сөз',
    },
    'w1e1gu2b': {
      'ru': '',
      'kk': '',
    },
    'c67xawbf': {
      'ru': 'Номер телефона должен начаться на +7',
      'kk': 'Телефон нөмірі +7-ден басталуы керек',
    },
    'j2qghitp': {
      'ru': '',
      'kk': '',
    },
    '3105p9li': {
      'ru': 'Введите смс код',
      'kk': 'SMS кодын енгізіңіз',
    },
    '09tjn1ht': {
      'ru': '',
      'kk': '',
    },
    'oe210xe9': {
      'ru': 'Неверный формат',
      'kk': 'Қате формат',
    },
    'rzvjyewa': {
      'ru': 'Загрузка фото/видео',
      'kk': 'Фото/бейне жүктеп салу',
    },
    'mistebrl': {
      'ru': 'Успешно',
      'kk': 'Сәтті',
    },
    'ks4pnp66': {
      'ru': 'Ошибка загрузки фото/видео',
      'kk': 'Фото/бейне жүктеп салу қатесі',
    },
    't20kljbi': {
      'ru': 'Отправка фото',
      'kk': 'Фото жіберу',
    },
    'ppoad0m4': {
      'ru': 'Выберите источник',
      'kk': 'Дереккөзді таңдаңыз',
    },
    'vpgvzqh9': {
      'ru': 'Гарелея',
      'kk': 'Гарелея',
    },
    '1t9662lh': {
      'ru': 'Гарелея(Фото)',
      'kk': 'Гарелея(фото)',
    },
    'lbp6feid': {
      'ru': 'Гарелея(Видео)',
      'kk': 'Гарелея(бейне)',
    },
    '114jnrzf': {
      'ru': 'Камера',
      'kk': 'Камера',
    },
    'g6kfdg8n': {
      'ru': '',
      'kk': '',
    },
    '9ct1zunl': {
      'ru': '',
      'kk': '',
    },
    'paa4juvo': {
      'ru': '',
      'kk': '',
    },
    'fqqxs3gb': {
      'ru': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
