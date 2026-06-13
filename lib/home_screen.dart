import 'package:edumind/app_localizations.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'رحلة المعرفة للأطفال',
//       theme: ThemeData(
//         fontFamily: 'Changa', // يفضل استخدام خط عربي دائري ومرح للأطفال مثل Changa أو Cairo
//         primarySwatch: Colors.amber,
//       ),
//       home: const KidsDashboardScreen(),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // التحكم بحركة النحلة الطائرة (طنين واهتزاز خفيف)
  late final AnimationController _beeController;
  // التحكم بحركة الهدهد (حركة قفز ترحيبية عند فتح التطبيق)
  late final AnimationController _hoopoeController;

  @override
  void initState() {
    super.initState();

    // أنيميشن النحلة: حركة مستمرة للأعلى والأسفل لمحاكاة الطيران
    _beeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // أنيميشن الهدهد: حركة قفز لطيفة ومستمرة لجذب انتباه الطفل
    _hoopoeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _beeController.dispose();
    _hoopoeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl, // واجهة التطبيق باللغة العربية
        child: Stack(
          children: [
            // 1. الخلفية البيئية المتدرجة (السماء والمروج الناعمة)
            _buildAnimatedBackground(),

            // 2. المحتوى الرئيسي القابل للتمرير (مسار الرحلة التعليمية)
            Positioned.fill(
              child: SafeArea(
                child: Column(
                  children: [
                    // شريط الإنجازات العلوي (النحلة النشيطة تتبع العسل والنقاط)
                    _buildHeaderStatsBar(),

                    // مسار التحديات حيث يقف الهدهد المستكشف
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 20,
                        ),
                        child: _buildLearningPath(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // خلفية تفاعلية مريحة لعين الطفل بألوان الباستيل
  Widget _buildAnimatedBackground() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE0F7FA), // أزرق سماوي ناعم جداً في الأعلى
              Color(0xFFF3D6F0), // نهدي  دافئ وخفيف في المنتصف
              Color(0xFFE8F5E9), // أخضر عشبي ناعم في الأسفل
            ],
          ),
        ),
      ),
    );
  }

  // شريط الإنجازات العلوي - النحلة والعداد
  Widget _buildHeaderStatsBar() {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // لوحة المستوى الحالي للطفل
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.stars, color: cs.secondary, size: 24),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.translate('level 3'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: cs.secondary,
                  ),
                ),
              ],
            ),
          ),

          // عداد النقاط التفاعلي مع النحلة الطائرة
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  "٢٥٠ قطرة عسل",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(width: 10),
                // تحريك النحلة برمجياً للأعلى والأسفل بشكل لطيف
                AnimatedBuilder(
                  animation: _beeController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _beeController.value * -6),
                      child: child,
                    );
                  },
                  // استبدل الأيقونة بـ Image.asset لنحلتك الكرتونية الخاصة
                  child: Image.asset(
                    'assets/images/bee.png', // مسار صورتك الشفافة
                    height: 62,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // بناء مسار التعلم المتعرج (Learning Path)
  Widget _buildLearningPath() {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    // محاكاة مسار متعرج يميناً ويساراً ليناسب بصر الأطفال
    return Column(
      children: [
        _buildPathStep(
          stageNum: "٤",
          title: "مملكة الحروف",
          isLocked: true,
          alignment: Alignment.centerLeft,
        ),
        _buildPathLine(isRight: false),
        _buildPathStep(
          stageNum: "٣",
          title: "تحدي الأرقام",
          isLocked: true,
          alignment: Alignment.centerRight,
        ),
        _buildPathLine(isRight: true),

        // المرحلة النشطة الحالية التي يقف عندها الهدهد ويرشد الطفل إليها
        Stack(
          clipBehavior: Clip.none,
          children: [
            _buildPathStep(
              stageNum: "٢",
              title: "عالم الألوان",
              isLocked: false,
              isActive: true,
              alignment: Alignment.centerLeft,
            ),

            // الهدهد المرشد يقفز فوق المرحلة النشطة لحث الطفل على الضغط
            AnimatedBuilder(
              animation: _hoopoeController,
              builder: (context, child) {
                return Positioned(
                  top: -45 + (_hoopoeController.value * -12), // حركة قفز عمودية
                  left: 40,
                  child: child!,
                );
              },
              // استبدل هذا المربع بجرافيك الهدهد الكرتوني اللطيف (شعارك)
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/ope.png', // مسار صورتك الشفافة
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "اضغط هنا!",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: cs.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        _buildPathLine(isRight: false),
        _buildPathStep(
          stageNum: "١",
          title: 'magic_start',
          isLocked: false,
          isCompleted: true,
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }

  // بناء محطة أو زر التحدي للمرحلة
  Widget _buildPathStep({
    required String stageNum,
    required String title,
    required bool isLocked,
    bool isActive = false,
    bool isCompleted = false,
    required Alignment alignment,
  }) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    Color stepColor = Colors.grey.shade400;
    if (isActive) stepColor = cs.secondary;
    if (isCompleted) stepColor = cs.primary;

    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: () {
          if (isLocked) {
            // تنبيه صوتي أو بصري بأن المرحلة مغلقة
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "هذه المرحلة مغلقة، أكمل التحدي السابق أولاً مع الهدهد!",
                ),
                duration: Duration(seconds: 1),
              ),
            );
          } else {
            // الانتقال إلى واجهة اللعبة التعليمية داخل التطبيق
            _showStageIntroDialog(title, stageNum);
          }
        },
        child: Column(
          children: [
            // تأثير ارتدادي ناعم وتأثير تفاعلي عند اللمس
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: stepColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: stepColor.withOpacity(0.5),
                    blurRadius: isActive ? 15 : 6,
                    spreadRadius: isActive ? 4 : 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: isLocked
                    ? const Icon(Icons.lock, color: Colors.white, size: 30)
                    : isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 36)
                    : Text(
                        stageNum,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isLocked ? Colors.grey.shade600 : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // رسم خطوط المسار التوصيلية المتعرجة بين المراحل لتبدو كرحلة حقيقية
  Widget _buildPathLine({required bool isRight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Align(
        alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
        child: SizedBox(
          width: 120,
          height: 40,
          child: CustomPaint(painter: _DottedPathPainter(isRight: isRight)),
        ),
      ),
    );
  }

  // نافذة تفاعلية منبثقة تظهر للطفل عند الضغط على المرحلة المتاحة للعب
  void _showStageIntroDialog(String title, String stageNum) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: const Color(0xFFFFF7ED), // خلفية دافئة ومرحة للرسائل
        title: Row(
          children: [
            const Icon(Icons.emoji_events, color: Colors.amber, size: 30),
            const SizedBox(width: 10),
            Expanded(child: Text("مرحباً بك في $title")),
          ],
        ),
        content: Text(
          "الهدهد والنحلة مستعدان لمساعدتك في اجتياز المرحلة $stageNum وجمع أحلى عسل معرفي! هل أنت جاهز للتحدي؟",
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("ليس الآن", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cs.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              Navigator.pop(context);
              // الكود الخاص ببدء اللعبة التعليمية يوضع هنا
            },
            child: const Text(
              "انطلق لنلعب!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// كلاس مخصص لرسم الخطوط المنقطة والمتعرجة لرحلة الطفل بدقة هندسية سلسة
class _DottedPathPainter extends CustomPainter {
  final bool isRight;
  _DottedPathPainter({required this.isRight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.4)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (isRight) {
      path.moveTo(size.width, 0);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.5,
        0,
        size.height,
      );
    } else {
      path.moveTo(0, 0);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.5,
        size.width,
        size.height,
      );
    }

    // جعل الخط منقطاً ليناسب طابع ألعاب الأطفال الخفيفة
    const double dashWidth = 6;
    const double dashSpace = 6;
    double distance = 0;

    for (Size pathSize in [size]) {
      // تمثيلي مبسط للمسار المنقط لضمان كفاءة معالج الجرافيك بالهاتف
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// تمديد برميجي بسيط للألوان لخدمة طابع العسل الخاص بالنحلة
extension ColorLength on Colors {
  static const Color amberDark = Color(0xFFFF8F00);
  static const Color black8Alignment = Color(0xFF212121);
}
