import 'package:flutter/material.dart';
import 'widgets/pressable_scale.dart'; // تأكد من استيراد الوجيهة التفاعلية الخاصة بك

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _logoController;
  late final Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();
    // حركة نبض مستمرة وآمنة لشعار التطبيق في الأعلى
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _logoScale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl, // دعم كامل للغة العربية
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'حول المغامرة',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: cs.secondary,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              // الخلفية المتدرجة الذكية والمشعة للتطبيق
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1.3,
                      colors: [cs.primary.withValues(alpha: 0.1), cs.surface],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    // شعار التطبيق الحركي النابض بالحياة
                    Center(
                      child: ScaleTransition(
                        scale: _logoScale,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [cs.primary, cs.secondary],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text('🧠', style: TextStyle(fontSize: 52)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // اسم التطبيق بهوية فخمة
                    Center(
                      child: Text(
                        'عقول ذكية · EduMind',
                        style: t.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    // رقم الإصدار بطابع الألعاب
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: cs.surfaceContainerHighest.withValues(
                            alpha: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: cs.outlineVariant.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Text(
                          'النسخة التجريبية المطورّة v1.0.0 🚀',
                          style: t.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: cs.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    Text(
                      'رسالتنا وهدفنا 🎯',
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // بطاقة الهدف الرئيسي للتطبيق
                    Container(
                      decoration: BoxDecoration(
                        color: cs.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: cs.primary.withValues(alpha: 0.15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: cs.shadow.withValues(alpha: 0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'انطلقنا برؤية طموحة لتحويل مناهج الرياضيات المدرسية الجافة إلى مغامرة بصرية تفاعلية مشوقة تناسب أبطالنا الصغار. نهدف إلى تنشيط خلايا الذكاء، وبناء مهارات التفكير المنطقي السريع عبر اللعب، والتحدي، وكسب الأوسمة والشارات التقديرية الفاخرة ليبقى طفلك متحفزاً للتعلم دائماً!',
                        style: t.textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'ركائز رِحلتنا التعليمية ✨',
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 1: اللعب والتعلم
                    _buildFeatureCard(
                      context,
                      emoji: '🎮',
                      title: 'التعلم القائم على الألعاب',
                      description:
                          'تدمير وحوش المسائل الحسابية وتحويل التمارين الصعبة إلى مستويات حماسية ممتعة.',
                      color: const Color(0xFF7C3AED),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 2: الذكاء الاصطناعي
                    _buildFeatureCard(
                      context,
                      emoji: '🤖',
                      title: 'مرافقة الذكي "إيدو"',
                      description:
                          'مرشد تفاعلي ذكي يبسط المفاهيم المعقدة، وينبض بالحياة لتشجيع طفلك خطوة بخطوة.',
                      color: const Color(0xFF14B8A6),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 3: الأوسمة والمكافآت
                    _buildFeatureCard(
                      context,
                      emoji: '🏆',
                      title: 'نظام الشرف والمكافآت',
                      description:
                          'جمع الأوسمة، ونقاط الـ XP، وتحديات الأيام المتتالية (Streak) لتعزيز روح الإنجاز والفخر.',
                      color: const Color(0xFFF59E0B),
                    ),
                    const SizedBox(height: 32),

                    // تذييل الصفحة اللطيف
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // لتوسيع المحتوى في المنتصف
                          children: [
                            // 1. النص (الجزء الأول)
                            Text(
                              'صُنع بكل حب لجيل المستقبل السوري الواعد ❤️',
                              style: TextStyle(
                                fontFamily: 'Cairo', // نفس الخط الجميل المعتمد
                                fontSize: 14,
                                color: const Color(
                                  0xFF6A1B9A,
                                ), // لون بنفسجي خفيف
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ), // مسافة صغيرة بين النص والعلم
                            // 2. العلم كصورة
                            Image.asset(
                              'assets/images/syrian_flag_new.png', // مسار صورة العلم الجديد الخاص بك
                              width: 24, // عرض صغير ومناسب
                              height: 24, // ارتفاع صغير ومناسب
                              fit: BoxFit.contain, // للحفاظ على أبعاد الصورة
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // وجيهة لبناء كروت الميزات التفاعلية القابلة للانضغاط عند اللمس
  Widget _buildFeatureCard(
    BuildContext context, {
    required String emoji,
    required String title,
    required String description,
    required Color color,
  }) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return PressableScale(
      borderRadius: BorderRadius.circular(22),
      onTap: () {}, // لمسة تفاعلية بدون إجراء لتسلية الطفل داخل الصفحة
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.05), cs.surface],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: t.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: t.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: cs.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
