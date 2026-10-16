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
  // HomePage
  {
    't32cuoy6': {
      'ru': 'На носилках',
      'kk': '',
    },
    'cgsdz7wq': {
      'ru': 'На носилках',
      'kk': '',
    },
    'cqopn8ep': {
      'ru': 'На коляске',
      'kk': '',
    },
    'evwxs60r': {
      'ru': 'На коляске',
      'kk': '',
    },
    'gxwt2pgi': {
      'ru': 'На легковой ',
      'kk': '',
    },
    '5h9x6x0d': {
      'ru': 'На легковой ',
      'kk': '',
    },
    'jmqo32et': {
      'ru': 'Откуда',
      'kk': '',
    },
    'dj5v5x7y': {
      'ru': 'Куда',
      'kk': '',
    },
    'd1ayeb3u': {
      'ru': 'Цена',
      'kk': '',
    },
    '3obzj0vp': {
      'ru': 'Выберите дату',
      'kk': '',
    },
    'blttx5wj': {
      'ru': 'Этаж',
      'kk': '',
    },
    'zao87ie0': {
      'ru': 'Комментарий водителю',
      'kk': '',
    },
    'maqgysvr': {
      'ru': 'Вес',
      'kk': '',
    },
    'k1ueia23': {
      'ru': 'Заказать',
      'kk': '',
    },
    '3drmi8im': {
      'ru': 'Город',
      'kk': 'Қала',
    },
  },
  // login
  {
    '8q8bnlyc': {
      'ru': 'Введите ваш номер\nтелефона для входа',
      'kk': 'Нөміріңізді енгізіңіз\nенгізу үшін телефон нөмірі',
    },
    'mfjd8bcg': {
      'ru': 'Номер телефона',
      'kk': 'Телефон нөмірі',
    },
    'j5y10aa2': {
      'ru': 'Введите номер телефона...',
      'kk': 'Телефон нөміріңізді енгізіңіз...',
    },
    'd84d0cr0': {
      'ru': 'Продолжить',
      'kk': 'Жалғастыру',
    },
  },
  // smsVirefication
  {
    'ubop26oq': {
      'ru': 'Введите СМС Код',
      'kk': 'SMS кодын енгізіңіз',
    },
    '68n3klgn': {
      'ru': 'СМС Код',
      'kk': 'SMS коды',
    },
    '7x2u9q5v': {
      'ru': 'Введите СМС Код',
      'kk': 'SMS кодын енгізіңіз',
    },
    'zrzm2hrb': {
      'ru': 'Продолжить',
      'kk': 'Жалғастыру',
    },
  },
  // setProfile
  {
    '6b5mr9kn': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'k98ouwju': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    'seq0y5x9': {
      'ru': 'Далее',
      'kk': 'Әрі қарай',
    },
    'olzku5e3': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    '955ni3ag': {
      'ru': 'Фамилия',
      'kk': 'Тегі',
    },
    '3gl6yo96': {
      'ru': 'ИИН',
      'kk': 'ЖСН',
    },
    '484os623': {
      'ru': 'Дата рождения',
      'kk': 'туған күні',
    },
    '74f7snkv': {
      'ru': 'Далее',
      'kk': 'Әрі қарай',
    },
    'f3e3tvnp': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // rejim
  {
    '3id9wkby': {
      'ru': 'Водитель',
      'kk': 'Жүргізуші',
    },
    'k9u3o52c': {
      'ru': 'Пассажир',
      'kk': 'Жолаушы',
    },
    '45vyscgt': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // uslugi
  {
    '321e46x5': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'qf3jiw8j': {
      'ru': 'Search...',
      'kk': '',
    },
    '96jfuu4q': {
      'ru': 'Option 1',
      'kk': '',
    },
    'bqw6viy4': {
      'ru': 'Option 2',
      'kk': '',
    },
    'l3kb1zb8': {
      'ru': 'Option 3',
      'kk': '',
    },
    'b8a9o2gi': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'cdpueapg': {
      'ru': 'Search...',
      'kk': '',
    },
    '236phtpa': {
      'ru': 'Option 1',
      'kk': '',
    },
    '8qw68ptc': {
      'ru': 'Option 2',
      'kk': '',
    },
    'p9kvx13a': {
      'ru': 'Option 3',
      'kk': '',
    },
    'nsxrjpk7': {
      'ru': 'Мои услуги',
      'kk': '',
    },
    'hq5jirev': {
      'ru': 'Удалить',
      'kk': '',
    },
    'euutcypv': {
      'ru': 'Добавить услугу',
      'kk': '',
    },
    'i34f2ed2': {
      'ru': 'Наименование вашей услуги',
      'kk': '',
    },
    '07tcypcj': {
      'ru': 'Цена ',
      'kk': '',
    },
    '0ooselcf': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'zs1kxsen': {
      'ru': 'Search...',
      'kk': '',
    },
    'wpo2zwjd': {
      'ru': 'Option 1',
      'kk': '',
    },
    'kpp517y3': {
      'ru': 'Option 2',
      'kk': '',
    },
    'g6qre4ag': {
      'ru': 'Option 3',
      'kk': '',
    },
    '6i1wyjid': {
      'ru': 'Выберите категорию',
      'kk': '',
    },
    'hm7u662p': {
      'ru': 'Search...',
      'kk': '',
    },
    '6v1stnmw': {
      'ru': 'Option 1',
      'kk': '',
    },
    'pumtrztw': {
      'ru': 'Option 2',
      'kk': '',
    },
    'e4vt39ho': {
      'ru': 'Option 3',
      'kk': '',
    },
    'cch65ebg': {
      'ru': 'Наименование вашей услуги',
      'kk': '',
    },
    'yks6k38s': {
      'ru': 'Добавить',
      'kk': '',
    },
    'mvxkgibp': {
      'ru': 'Услуги',
      'kk': 'Қызметтер',
    },
  },
  // post
  {
    'r1875e83': {
      'ru': 'Доставка еды',
      'kk': 'Тамақ жеткізу',
    },
  },
  // profile
  {
    'syts6p3p': {
      'ru': 'Настройки',
      'kk': 'Параметрлер',
    },
    'k64apm2v': {
      'ru': 'Русский язык',
      'kk': 'орыс тілі',
    },
    'css1tnhn': {
      'ru': 'Казахский язык',
      'kk': 'Қазақ тілі',
    },
    'ktxcnax7': {
      'ru': 'Выйти с аккаунта',
      'kk': 'Тіркелгіңізден шығыңыз',
    },
    'w0ogglqz': {
      'ru': 'Удалить аккаунт',
      'kk': 'Есептік жазбаны жою',
    },
    'jfo9zw67': {
      'ru': 'Профиль',
      'kk': 'Профиль',
    },
  },
  // AllChatsPage
  {
    'skv71270': {
      'ru': 'ЧАТ',
      'kk': 'ЧАТ',
    },
    'qszfi9n1': {
      'ru': 'ЧАТ',
      'kk': 'ЧАТ',
    },
  },
  // meOrder
  {
    'ehfg3zec': {
      'ru': 'Мои заказы',
      'kk': '',
    },
    'yx98bqpc': {
      'ru': 'Активный',
      'kk': '',
    },
    'ef2qh1o9': {
      'ru': 'Принять',
      'kk': '',
    },
    'iyg5ae05': {
      'ru': 'Отклонить',
      'kk': '',
    },
    'jhnkegc6': {
      'ru': 'История',
      'kk': '',
    },
    'cblg30k5': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // selectPrice
  {
    'ife0ape5': {
      'ru': 'Предложить цену',
      'kk': '',
    },
    'mep9ypzv': {
      'ru': '+100',
      'kk': '',
    },
    'ujmwswgv': {
      'ru': '+200',
      'kk': '',
    },
    'u77jrivf': {
      'ru': '+300',
      'kk': '',
    },
    'nqna65m9': {
      'ru': 'Отмена',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    '2v4dbdq7': {
      'ru': 'Загрузка фото',
      'kk': 'Фото жүктеп салынуда',
    },
    'oiqsmn1h': {
      'ru': 'Загрузка фото',
      'kk': 'Фото жүктеп салынуда',
    },
    'u6hy4dv3': {
      'ru': 'Определение местоположения',
      'kk': 'Орналасқан жерді анықтау',
    },
    'fiks8z2q': {
      'ru': 'Получение уведомлений',
      'kk': 'Хабарландырулар алу',
    },
    'dg2dkmjx': {
      'ru': 'Выбор даты рождения',
      'kk': 'Туған күніңізді таңдау',
    },
    'an3imoyd': {
      'ru': '',
      'kk': '',
    },
    'u4ycect0': {
      'ru': '',
      'kk': '',
    },
    'oxztglji': {
      'ru': '',
      'kk': '',
    },
    'izhzo3xg': {
      'ru': '',
      'kk': '',
    },
    'f55fwr2x': {
      'ru': '',
      'kk': '',
    },
    'yz8s7t08': {
      'ru': '',
      'kk': '',
    },
    'su3m56cx': {
      'ru': '',
      'kk': '',
    },
    'khyz7mbg': {
      'ru': '',
      'kk': '',
    },
    'rfac2pk6': {
      'ru': '',
      'kk': '',
    },
    'af4f4fvx': {
      'ru': '',
      'kk': '',
    },
    'k8dr9o3u': {
      'ru': '',
      'kk': '',
    },
    's73801ea': {
      'ru': '',
      'kk': '',
    },
    'tbptlzo4': {
      'ru': '',
      'kk': '',
    },
    'w327044r': {
      'ru': '',
      'kk': '',
    },
    '0gqh7yn4': {
      'ru': '',
      'kk': '',
    },
    'v3xxp86v': {
      'ru': '',
      'kk': '',
    },
    'fvmwv3mt': {
      'ru': '',
      'kk': '',
    },
    's2olrvbl': {
      'ru': '',
      'kk': '',
    },
    'rwkobnn6': {
      'ru': '',
      'kk': '',
    },
    'c667y29x': {
      'ru': '',
      'kk': '',
    },
    'yetcsnhx': {
      'ru': '',
      'kk': '',
    },
    'kmphr0jj': {
      'ru': '',
      'kk': '',
    },
    'wgxczrs2': {
      'ru': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
