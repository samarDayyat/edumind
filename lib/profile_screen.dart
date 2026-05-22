import 'package:flutter/material.dart';
import 'widgets/pressable_scale.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl, // تفعيل الاتجاه العربي
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ملفي الشخصي',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          elevation: 0,
          backgroundColor: cs.secondary,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // خلفية متدرجة ومشعة تناسب هوية التطبيق الذكية
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.4,
                    colors: [cs.primary.withValues(alpha: 0.12), cs.surface],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 110, 22, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // بطاقة الـبروفايل الرئيسية مع حركة دخول من الأعلى
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -20 * (1 - value)),
                        child: Opacity(opacity: value, child: child),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
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
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: cs.primary.withValues(alpha: 0.1),
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            // الصورة الشخصية للبطل (الساحر)
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: cs.primary.withValues(
                                alpha: 0.2,
                              ),
                              child: const Text(
                                '🧙',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ملاذ البطل ',
                                    style: t.textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'الصف السابع · مستكشف الرياضيات 🧠',
                                    style: t.textTheme.bodyMedium?.copyWith(
                                      color: cs.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                      begin: 0.95,
                                      end: 1.05,
                                    ),
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                    builder: (context, scale, child) {
                                      return Transform.scale(
                                        scale: (scale > 1.0)
                                            ? 2.0 - scale
                                            : scale,
                                        child: child,
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: cs.secondary.withValues(
                                          alpha: 0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        border: Border.all(
                                          color: cs.secondary,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Text(
                                        '🏆 المستوى 1',
                                        style: t.textTheme.labelLarge?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: cs.secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // شارة المستوى النابضة والمتوهجة
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // إحصائيات البطل الحركية
                  Row(
                    children: const [
                      Expanded(
                        child: _StatCard(
                          title: 'نقاط الخبرة XP',
                          value: '320 نقطة',
                          color: Color(0xFFF59E0B),
                          icon: Icons.star_rounded,
                          delay: 100,
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _StatCard(
                          title: 'أيام الحماس 🔥',
                          value: '3 أيام',
                          color: Color(0xFFEF4444),
                          icon: Icons.local_fire_department_rounded,
                          delay: 200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const _StatCard(
                    title: '🎯 هدفي اليومي',
                    value: 'إتمام درسين كل يوم',
                    color: Color(0xFF7C3AED),
                    icon: Icons.gps_fixed_rounded,
                    delay: 300,
                  ),
                  const SizedBox(height: 20),

                  // لوحة الأوسمة والشارات التفاعلية
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: Border.all(
                        color: cs.outlineVariant.withValues(alpha: 0.4),
                      ).bottom,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '🏅 أوسمة الشرف والأبطال',
                            style: t.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // الشارات تظهر بتأثير مبهج ومتتابع
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            runAlignment: WrapAlignment.center,
                            children: const [
                              _Badge('⭐', 'النجم اللامع', 1),
                              _Badge('🧠', 'المفكر الذكي', 2),
                              _Badge('🔥', 'الشعلة النشيطة', 3),
                              _Badge('🏆', 'صائد الكؤوس', 4),
                            ],
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
    );
  }
}

// وجيهة كروت الإحصائيات مع حركة ظهور متتابعة
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.delay,
  });

  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final int delay; // لتأخير الحركة وصنع تأثير متتابع جذاب

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + delay),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(scale: 0.8 + (0.2 * value), child: child),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withValues(alpha: 0.15), cs.surface],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: t.textTheme.labelLarge?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onSurface,
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
}

// وجيهة الأوسمة التفاعلية القابلة للضغط والاهتزاز
class _Badge extends StatelessWidget {
  const _Badge(this.emoji, this.title, this.index);
  final String emoji;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return PressableScale(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        // هنا يمكن إظهار رسالة منبثقة منبثقة تخبر الطفل عن إنجازه الرائع!
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'لقد حصلت على وسام: $title! تابع التقدم يا بطل! 🎉',
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: cs.primary,
          ),
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 300 * index),
        curve: Curves.elasticOut, // حركة قفز مرنة ومحببة للأطفال
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: cs.primary.withValues(alpha: 0.25),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cs.primary.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 26)),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: cs.onSurfaceVariant,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
