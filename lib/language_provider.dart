import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // اللغة الافتراضية للتطبيق (مثلاً العربية)
  Locale _currentLocale = const Locale('ar');

  Locale get currentLocale => _currentLocale;

  // دالة لتغيير اللغة وتحديث الواجهات فوراً
  void changeLanguage(String languageCode) {
    if (_currentLocale.languageCode == languageCode) return;
    _currentLocale = Locale(languageCode);
    notifyListeners(); // إشعار التطبيق بالكامل بالتحديث
  }
}
