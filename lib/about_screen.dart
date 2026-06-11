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
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          //   centerTitle: true,
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
                    // اسم التطبيق بهوية openMind الجديدة
                    Center(
                      child: Text(
                        'openMind',
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

                    // === قسم: لماذا openMind؟ ===
                    Text(
                      'لماذا openMind؟ 🤔',
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
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
                        'لأن كل طالب لا يحتاج أن يُقارن بغيره، بل أن يُفهم كما هو.\n\n'
                        'وراء كل طالب طريقة خاصة في الفهم، واهتمام يشدّه، وموهبة تنتظر أن تجد مكانها.\n\n'
                        'في عالم مليء بالشاشات، الألعاب، المحتوى السريع، وكثرة الخيارات، صار الطالب يحتاج تجربة تعلّم تشدّه بوعي، وتساعده يركّز، ويفهم أين يمكن أن يكون طريقه.\n\n'
                        'صممنا openMind ليحوّل التعلّم من حفظ جامد إلى تجربة تفاعلية قريبة من الطالب؛ يتعلّم، يجرّب، يخطئ، يفهم، ثم يبدأ يرى طريقه بشكل أوضح.',
                        style: t.textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // === قسم: رؤيتنا ===
                    Text(
                      'رؤيتنا ✨',
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: cs.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: cs.secondary.withValues(alpha: 0.15),
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
                        'أن نجعل التعلّم مساحة آمنة وشخصية، تساعد كل طالب على أن يفهم بطريقته، يكتشف ما يشدّه، ويربط ما يتعلّمه بحياته وواقعه ومستقبله.\n\n'
                        'نؤمن أن العلم ليس للحفظ فقط، بل لفهم الحياة وخدمة الناس، وأن المجتمع الأقوى لا يُبنى من أشخاص متشابهين، بل من أشخاص يعرف كل واحد منهم قيمته ومكانه.',
                        style: t.textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // === قسم: ماذا يفعل openMind؟ ===
                    Text(
                      'ماذا يفعل openMind؟ 🚀',
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 1
                    _buildFeatureCard(
                      context,
                      emoji: '🎮',
                      title: 'التحديات التفاعلية',
                      description:
                          'يحوّل الدروس إلى تحديات وتجارب تفاعلية مشوقة.',
                      color: const Color(0xFF7C3AED),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 2
                    _buildFeatureCard(
                      context,
                      emoji: '🧠',
                      title: 'تقريب الأفكار ذكياً',
                      description:
                          'يقرّب الفكرة بالطريقة الأنسب والأقرب لذهن الطالب.',
                      color: const Color(0xFF14B8A6),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 3
                    _buildFeatureCard(
                      context,
                      emoji: '🧭',
                      title: 'استكشاف الاهتمامات',
                      description:
                          'يتعلّم من اختيارات الطالب ليكشف اهتماماته وميوله المستقبليّة.',
                      color: const Color(0xFFF59E0B),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 4
                    _buildFeatureCard(
                      context,
                      emoji: '🌍',
                      title: 'الربط بالواقع الحقيقي',
                      description:
                          'يريه كيف يرتبط ما يتعلّمه بالحياة الواقعية والعملية من حوله.',
                      color: const Color(0xFF3B82F6),
                    ),
                    const SizedBox(height: 12),

                    // ميزة 5
                    _buildFeatureCard(
                      context,
                      emoji: '🤝',
                      title: 'بناء القيمة الذاتية',
                      description:
                          'يساعده أن يشعر أن له قيمة فريدة، وطريقاً واضحاً، ومكاناً في المجتمع.',
                      color: const Color(0xFFEF4444),
                    ),

                    // تذييل الصفحة اللطيف
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'صُنع بكل حب لجيل المستقبل السوري الواعد ❤️',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 14,
                                color: Color(0xFF6A1B9A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/syrian_flag_new.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
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
