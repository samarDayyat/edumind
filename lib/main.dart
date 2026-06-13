import 'package:edumind/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'onboarding_screen.dart';

// 1. استيراد الملفات الجديدة لإدارة اللغة والترجمة
// (تأكد من تعديل المسارات بناءً على أسماء ملفاتك)
import 'language_provider.dart';
import 'app_localizations.dart';

void main() {
  runApp(
    // استخدام MultiProvider لإدارة الـ Theme والـ Language معاً
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ), // إضافة مزود اللغة
      ],
      child: const EduMindApp(),
    ),
  );
}

/// Brand colors: purple primary, orange secondary (Duolingo-style energy).
ThemeData _buildTheme() {
  const purple = Color(0xFF4C1D95); // deep purple
  const orange = Color(0xFFF59E0B); // gold/orange
  const teal = Color(0xFF14B8A6);
  const cream = Color(0xFFFFF7ED);
  final base = ColorScheme.fromSeed(
    seedColor: purple,
    brightness: Brightness.light,
    secondary: orange,
    tertiary: teal,
  );
  return ThemeData(
    colorScheme: base,
    useMaterial3: true,
    scaffoldBackgroundColor: cream,
    textTheme: Typography.material2021().black.apply(fontFamily: null),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: base.primary,
      foregroundColor: base.onPrimary,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: base.surface,
      elevation: 4,
      shadowColor: base.shadow.withValues(alpha: 0.14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: base.surfaceContainerHighest.withValues(alpha: 0.65),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
          color: base.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        elevation: 3,
        shadowColor: base.shadow.withValues(alpha: 0.22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 76,
      backgroundColor: base.primary.withValues(alpha: 0.08),
      indicatorColor: base.secondary.withValues(alpha: 0.22),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.w800, color: base.onSurfaceVariant),
      ),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? base.secondary : base.onSurfaceVariant,
          size: 26,
        );
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: base.secondary,
      foregroundColor: base.onSecondary,
    ),
  );
}

class EduMindApp extends StatelessWidget {
  const EduMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء الـ Providers للاستماع للتغييرات في الثيم واللغة
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: 'EduMind',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData, // الثيم الخاص بك
      // 2. ربط اللغة الحالية المحددة من قبل الطالب بالتطبيق
      locale: languageProvider.currentLocale,

      // 3. إضافة الـ Delegates للترجمة متضمنة الـ AppLocalizations الخاص بك
      localizationsDelegates: [
        AppLocalizations.delegate, // ملف الترجمة الخاص بك لتغيير النصوص برمجياً
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // 4. تحديد اللغات التي يدعمها التطبيق بالكامل
      supportedLocales: const [
        Locale('ar'), // العربية
        Locale('en'), // الإنجليزية
      ],

      home: const OnboardingScreen(),
    );
  }
}
