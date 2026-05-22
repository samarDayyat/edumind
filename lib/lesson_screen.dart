import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({
    super.key,
    this.lessonTitle = 'جمع الأعداد العادية (الكسور)',
    this.explanation =
        'لنجعل القطع متساوية أولاً! ابحث عن مقام مشترك يمكن لكل من الكسرين استخدامه، ثم اجمع الأرقام الموجودة في الأعلى (البسط). أنت بطل وتستطيع فعلها، لنبدأ التمرين معاً!',
    this.exampleText = 'مثال توضيحي:  ¼ + ¼ = ²⁄₄ = ½',
  });

  final String lessonTitle;
  final String explanation;
  final String exampleText;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

// استخدام SingleTickerProviderStateMixin لإدارة الحركة المستمرة بكفاءة
class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _robotAnimationController;
  late final Animation<double> _robotScaleAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد متحكم الحركة ليعمل على النبض المستمر والذهاب والإياب
    _robotAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200), // سرعة نبض مريحة للعين
      vsync: this,
    )..repeat(reverse: true); // التكرار المستمر ذهاباً وإياباً

    // تحديد أبعاد النبض (يكبر بمقدار 8% ثم يعود لحجمه الطبيعي بأمان)
    _robotScaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(
        parent: _robotAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _robotAnimationController.dispose(); // إغلاق المتحكم لحماية ذاكرة الهاتف
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(
            widget.lessonTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          elevation: 0,
          backgroundColor: cs.secondary,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              // خلفية حيوية آمنة
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.5,
                      colors: [
                        cs.secondary.withValues(alpha: 0.08),
                        cs.surface,
                      ],
                    ),
                  ),
                ),
              ),
              // محتوى الصفحة الرئيسي
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // مهارة جديدة تلمع
                      Row(
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: const Duration(seconds: 20),
                            curve: Curves.linear,
                            builder: (context, value, child) {
                              return Transform.rotate(
                                angle: value * 2 * 3.14159,
                                child: child,
                              );
                            },
                            child: SizedBox(
                              width: 28,
                              height: 28,
                              child: Icon(
                                Icons.auto_awesome_rounded,
                                size: 28,
                                color: cs.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'مهارة جديدة تلمع في عقلك! ✨',
                            style: t.textTheme.labelLarge?.copyWith(
                              color: cs.secondary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // صندوق شرح الروبوت الذكي "إيدو" مع النبض المستمر والآمن للروبوت
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 15 * (1 - value)),
                            child: Opacity(opacity: value, child: child),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                cs.primaryContainer.withValues(alpha: 0.85),
                                cs.surface,
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                            ),
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: cs.shadow.withValues(alpha: 0.06),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                            border: Border.all(
                              color: cs.primary.withValues(alpha: 0.15),
                            ),
                          ),
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  // النبض الدائم والمستمر للروبوت باستخدام ScaleTransition المستقرة والمحترفة
                                  ScaleTransition(
                                    scale: _robotScaleAnimation,
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: cs.primary.withValues(
                                          alpha: 0.15,
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: cs.primary.withValues(
                                              alpha: 0.1,
                                            ),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '🤖',
                                          style: TextStyle(fontSize: 26),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'الذكي إيدو',
                                    style: t.textTheme.labelSmall?.copyWith(
                                      color: cs.primary,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.explanation,
                                    style: t.textTheme.bodyLarge?.copyWith(
                                      height: 1.6,
                                      fontWeight: FontWeight.w700,
                                      color: cs.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // الأوسمة والبطاقات الصغيرة
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _Chip(
                            text: '🏆 +20 XP نقطة',
                            color: cs.secondary,
                            index: 1,
                          ),
                          _Chip(
                            text: '⭐️ مستواك: سهل',
                            color: Colors.green,
                            index: 2,
                          ),
                          _Chip(
                            text: '⏱️ الوقت: دقيقة واحدة',
                            color: cs.primary,
                            index: 3,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      Text(
                        'إليك هذا المثال التوضيحي السحري 🪐',
                        style: t.textTheme.titleSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // كرت المثال الملون والمشع لتركيز دماغ الطفل
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.amber.withValues(alpha: 0.15),
                              cs.secondaryContainer.withValues(alpha: 0.25),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.amber.withValues(alpha: 0.5),
                            width: 2.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(22),
                        child: Center(
                          child: Text(
                            widget.exampleText,
                            textAlign: TextAlign.center,
                            style: t.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: cs.onSurface,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),

                      // زر الإجراء الكبير
                      _BigCta(
                        text: 'جرّب حظك وابدأ التحدي الآن! 🚀',
                        onTap: () {},
                      ),
                    ],
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

// بطاقات الـ Chip الصغيرة والمحسنة
class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.color, required this.index});
  final String text;
  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 150 * index),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
        ),
        child: Text(
          text,
          style: t.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
      ),
    );
  }
}

// زر الإجراء الكبير والمميز للألعاب
class _BigCta extends StatefulWidget {
  const _BigCta({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  State<_BigCta> createState() => _BigCtaState();
}

class _BigCtaState extends State<_BigCta> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context);

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [cs.secondary, cs.secondary.withValues(alpha: 0.85)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: cs.secondary.withValues(alpha: 0.3),
                blurRadius: _pressed ? 4 : 16,
                offset: _pressed ? const Offset(0, 2) : const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: t.textTheme.titleMedium?.copyWith(
                  color: cs.onSecondary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.sports_esports_rounded,
                size: 26,
                color: cs.onSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
