import 'package:edumind/login_screen.dart';
import 'package:edumind/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// نموذج يمثل سمة الشغف المتاحة للطالب لسهولة إدارتها وتوسيعها لاحقاً
class PassionTheme {
  final String name;
  final String description;
  final String emoji;
  final Color primaryColor;
  final Color accentColor;
  final Color backgroundColor;

  const PassionTheme({
    required this.name,
    required this.description,
    required this.emoji,
    required this.primaryColor,
    required this.accentColor,
    required this.backgroundColor,
  });
}

class ThemeSelectionScreen extends StatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  // قائمة السمات الإبداعية المستوحاة من اهتمامات الطلاب المختلفة
  final List<PassionTheme> _themes = const [
    PassionTheme(
      name: 'شغف العلوم والتكنولوجيا',
      description: 'لعشاق الفضاء، الروبوتات والذكاء الاصطناعي 🌌',
      emoji: '🤖',
      primaryColor: Color(0xFF311B92), // بنفسجي غامق جداً
      accentColor: Color(0XFF8E24AA), // نهدي مضيء
      backgroundColor: Color(0xFFA7FFEB), // خلفية تلميح سماوي
    ),
    PassionTheme(
      name: 'شغف الفن والإبداع',
      description: 'لصناع القصص ورسامي الخيال اللامتناهي 🎨',
      emoji: '🎨',
      primaryColor: Color(0xFFE91E63), // وردي حيوي
      accentColor: Color(0xFFFF9800), // برتقالي دافئ
      backgroundColor: Color(0xFFFFE0B2), // خلفية مشمشية دافئة
    ),
    PassionTheme(
      name: 'شغف الرياضة والمغامرة',
      description: 'لمحبي التحديات البدنية والنشاط الدائم ⚽',
      emoji: '⚡',
      primaryColor: Color(0xFF1B5E20), // أخضر غابة عميق
      accentColor: Color(0xFFFFEB3B), // أصفر ساطع
      backgroundColor: Color(0xFFE8F5E9), // خلفية عشبية فاتحة
    ),
    PassionTheme(
      name: 'شغف الألعاب والتحدي',
      description: 'لعشاق حل الألغاز وتجاوز مستويات المعرفة 🎮',
      emoji: '🎮',
      primaryColor: Color(0xFF0D47A1), // أزرق كحلي قوي
      accentColor: Color(0xFF14B8A6), // أرجواني فاقع
      backgroundColor: Color(0xFFE1F5FE), // خلفية زرقاء هادئة
    ),
  ];

  // السمة الافتراضية المحددة هي الأولى (العلوم والتكنولوجيا)
  int _selectedThemeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentTheme = _themes[_selectedThemeIndex];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'اختر لون شغفك',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: currentTheme.primaryColor,
        elevation: 4,
        // تأثير انتقال سلس للون الـ AppBar عند تغيير السمة
        actions: [
          IconButton(
            icon: const Icon(Icons.palette_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان والوصف الإرشادي اللطيف
              const Text(
                'لوّن رحلتك التعليمية! 🎨',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'اختر السمة التي تعكس حماسك وشغفك، وسنقوم بتلوين كافة أقسام التطبيق  لتناسب ذوقك الفريد.',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 25,
              ), // جزء الابتكار: بطاقة معاينة حية (Live Preview) توضح كيف سيبدو التطبيق
              const Text(
                'معاينة حية لتطبيقك الجديد:',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: currentTheme.primaryColor.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: currentTheme.primaryColor.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: currentTheme.primaryColor
                              .withOpacity(0.1),
                          child: Text(
                            currentTheme.emoji,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'رحلتي اليومية',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'لقب المكتشف الذكي 🏆',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // شريط إنجاز وهمي يتغير لونه ديناميكياً
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'مستوى التقدم الدراسي',
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 13),
                        ),
                        Text(
                          '75%',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: currentTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                currentTheme.primaryColor,
                                currentTheme.accentColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // زر معاينة وهمي
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: currentTheme.accentColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'ابدأ الاختبار السريع 🚀',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // خيارات تحديد السمة بطريقة شبكية تفاعلية
              const Text(
                'اختر شغفك المفضل لتطبيق الألوان:',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _themes.length,
                itemBuilder: (context, index) {
                  final themeOption = _themes[index];
                  final isSelected = _selectedThemeIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedThemeIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? themeOption.backgroundColor.withOpacity(0.3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected
                                ? themeOption.primaryColor
                                : Colors.grey[300]!,
                            width: isSelected ? 2.5 : 1,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: themeOption.primaryColor.withOpacity(
                                      0.15,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          children: [
                            // إيقونة معبرة ملونة بالخلفية المحددة للسمة
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? themeOption.primaryColor
                                    : Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                themeOption.emoji,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // معلومات السمة
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    themeOption.name,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? themeOption.primaryColor
                                          : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    themeOption.description,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // مؤشر الاختيار الدائري المخصص بألوان السمة
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? themeOption.primaryColor
                                      : Colors.grey[400]!,
                                  width: 2,
                                ),
                                color: isSelected
                                    ? themeOption.accentColor
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 35,
              ), // زر التأكيد والانتقال لإنشاء الحساب النهائي
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // 1. تحديث ألوان التطبيق بالكامل فوراً عبر الـ Provider
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).updateTheme(
                        currentTheme.primaryColor,
                        currentTheme.accentColor,
                      );

                      // 2. الانتقال إلى الواجهة التالية (الرئيسية أو الـ Login)
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      shadowColor: currentTheme.primaryColor.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تأكيد السمة والانطلاق',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                currentTheme.backgroundColor
                                        .computeLuminance() >
                                    0.5
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.rocket_launch_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
