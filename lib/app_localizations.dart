import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
  // تابع مساعد للوصول إلى الترجمة من الـ Widgets
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // خريطة النصوص المترجمة
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome to EduMind',
      'magic_start': 'Magic Start',
      'change_language': 'Change Language',
      'student_profile': 'Student Profile',
      'level 3': 'Level 3',
    },
    'ar': {
      'welcome': 'مرحباً بك في إيدوميند',
      'magic_start': 'البداية السحرية',
      'change_language': 'تغيير اللغة',
      'student_profile': 'ملف الطالب',
      'level 3': 'المستوى 3',
    },
  };

  // دالة لجلب النص بناءً على مفتاح الكلمة واللغة الحالية
  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

// الـ Delegate الخاص بالترجمة
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
