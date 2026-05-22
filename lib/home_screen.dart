import 'package:edumind/about_screen.dart';
import 'package:flutter/material.dart';

import 'game_screen.dart';
import 'lesson_screen.dart';

import 'widgets/pressable_scale.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // معلومات تجريبية ثابتة — بدون حالة أو طبقة بيانات حتى الآن.
  static const String _username = 'ملاذ';
  static const int _xpCurrent = 320;
  static const int _xpGoal = 500;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    final xpFraction = _xpCurrent / _xpGoal;

    // وجيهة مخصصة للأزرار الشبكية (الدروس، التحديات...)
    Widget tile({
      required String title,
      required String subtitle,
      required IconData icon,
      required List<Color> colors,
      VoidCallback? onTap,
    }) {
      return PressableScale(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: colors.last.withValues(alpha: 0.3),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // أيقونة تتوهج بنبض لطيف ومستمر
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.9, end: 1.1),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, scale, child) {
                  return Transform.scale(scale: scale, child: child);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(icon, color: Colors.white, size: 26),
                ),
              ),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: t.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: t.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Directionality(
      textDirection:
          TextDirection.rtl, // تفعيل اتجاه اللغة العربية من اليمين لليسار
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'عقول ذكية · EduMind',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          elevation: 0,
          backgroundColor: cs.secondary,
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline_rounded, size: 28),
              onPressed: () {
                // الانتقال السلس والمضمون إلى واجهة "حول التطبيق"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            const SizedBox(width: 8), // مسافة أمان صغيرة للحافة
          ],
        ),
        extendBodyBehindAppBar: true,

        body: Stack(
          children: [
            // خلفية حيوية مشعة ومريحة للطفل
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment
                        .topRight, // متناسب مع الاتجاه العربيradius: 1.4,
                    colors: [cs.primary.withValues(alpha: 0.12), cs.surface],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 110, 22, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // بطاقة الترحيب مع حركة دخول لطيفة من الأسفل للأعلى
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - value)),
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
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            // صورة الساحر تنبض بالذكاء والحيوية
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.8, end: 1.0),
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.elasticOut,
                              builder: (context, scale, child) =>
                                  Transform.scale(scale: scale, child: child),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: cs.primary.withValues(
                                  alpha: 0.2,
                                ),
                                child: const Text(
                                  '🧙',
                                  style: TextStyle(fontSize: 28),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'مرحباً، $_username 👋',
                                    style: t.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'مستعد لمغامرة رياضيات سريعة؟',
                                    style: t.textTheme.bodyMedium?.copyWith(
                                      color: cs.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            // عداد قطع الذهب المتوهج
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(
                                  color: Colors.amber.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    '🪙',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '$_xpCurrent',
                                    style: t.textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.amber.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // بطاقة الأيام المتتالية (Streak) النابضة
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.96, end: 1.02),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    builder: (context, scale, child) =>
                        Transform.scale(scale: scale, child: child),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            cs.errorContainer.withValues(alpha: 0.4),
                            cs.surface,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.orange.withValues(alpha: 0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withValues(alpha: 0.1),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            const Text('🔥', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'الحماس مستمر · 3 أيام متتالية!',
                                style: t.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.orange.shade900,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Text(
                                '⭐️ +20',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // شريط الخبرة والتقدم الذكي
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '⭐️ مستوى التقدم والخبرة',
                        style: t.textTheme.labelLarge?.copyWith(
                          color: cs.onSurfaceVariant,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '$_xpCurrent / $_xpGoal XP',
                        style: t.textTheme.bodySmall?.copyWith(
                          color: cs.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // شريط التقدم ينمو بسلاسة عند فتح الشاشة لتشجيع الطفل
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: xpFraction),
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, value, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 14,
                          backgroundColor: cs.surfaceContainerHighest,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            cs.secondary,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  // شبكة الأزرار والخيارات الرئيسية بالعربية
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.15,
                    children: [
                      tile(
                        title: 'الدروس الممتعة',
                        subtitle: 'ابدأ من هنا 🚀',
                        icon: Icons.menu_book_rounded,
                        colors: const [Color(0xFF6366F1), Color(0xFF4F46E5)],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const LessonScreen(),
                          ),
                        ),
                      ),
                      tile(
                        title: 'التحديات اليومية',
                        subtitle: 'سباق الأبطال ⏱️',
                        icon: Icons.local_fire_department_rounded,
                        colors: const [Color(0xFFF59E0B), Color(0xFFEA580C)],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const GameScreen(),
                          ),
                        ),
                      ),
                      tile(
                        title: 'نادي التدريب',
                        subtitle: 'مرّن عقلك مئة مرة 🧠',
                        icon: Icons.fitness_center_rounded,
                        colors: const [Color(0xFF10B981), Color(0xFF059669)],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const GameScreen(),
                          ),
                        ),
                      ),
                      tile(
                        title: 'لوحة الإنجازات',
                        subtitle: 'قاعة الأوسمة والجوائز 🏆',
                        icon: Icons.emoji_events_rounded,
                        colors: const [Color(0xFFEC4899), Color(0xFFD946EF)],
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // زر "تابع التعلم" الذكي والمشع
                  PressableScale(
                    borderRadius: BorderRadius.circular(26),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const LessonScreen(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            cs.surface,
                            cs.primaryContainer.withValues(alpha: 0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: cs.primary.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          // أيقونة الهدف النابضة
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.9, end: 1.1),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            builder: (context, scale, child) =>
                                Transform.scale(scale: scale, child: child),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: cs.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.gps_fixed_rounded,
                                color: cs.primary,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '🎯 تابع رحلة التعلم',
                                  style: t.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'جمع الأعداد العادية · الوحدة الثالثة',
                                  style: t.textTheme.bodyMedium?.copyWith(
                                    color: cs.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_left_rounded,
                            color: cs.primary,
                          ), // تم تغيير السهم ليناسب الاتجاه العربي
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // الكروت السفلية التفاعلية
                  Row(
                    children: const [
                      Expanded(child: DailyChallengeCard()),
                      SizedBox(width: 14),
                      Expanded(child: RewardMiniCard()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const ProgressPathCard(),
                  const SizedBox(height: 14),
                  const DailyGoalBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// كرت التحدي السريع
class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return PressableScale(
      borderRadius: BorderRadius.circular(26),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => const GameScreen()),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cs.secondaryContainer.withValues(alpha: 0.6), cs.surface],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: cs.secondary.withValues(alpha: 0.2)),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⚡️ تحدي اليوم',
              style: t.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '3 أسئلة سريعة وذكية',
              style: t.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: cs.secondary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'انطلق',
                    style: TextStyle(
                      color: cs.onSecondary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  '+15 XP',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: cs.secondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// كرت صندوق الهدية النابض بانتظار البطل ليفتحه
class RewardMiniCard extends StatelessWidget {
  const RewardMiniCard({super.key});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return PressableScale(
      borderRadius: BorderRadius.circular(26),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cs.primaryContainer.withValues(alpha: 0.4), cs.surface],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: cs.primary.withValues(alpha: 0.15)),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎁 هدية بانتظارك',
              style: t.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'جاهزة للفتح الآن!',
              style: t.textTheme.bodySmall?.copyWith(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // تأثير حركة نبض مستمرة لإغراء الطفل بالضغط على الصندوق
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 1.0, end: 1.2),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: (scale > 1.1) ? 2.2 - scale : scale,
                  child: child,
                );
              },
              child: const Text('🧰', style: TextStyle(fontSize: 32)),
            ),
          ],
        ),
      ),
    );
  }
}

// خريطة طريق الأبطال
class ProgressPathCard extends StatelessWidget {
  const ProgressPathCard({super.key});

  static const List<_Node> _nodes = [
    _Node(label: '1', color: Color(0xFF6366F1), icon: Icons.looks_one_rounded),
    _Node(label: '2', color: Color(0xFF3B82F6), icon: Icons.looks_two_rounded),
    _Node(label: '3', color: Color(0xFF10B981), icon: Icons.looks_3_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.4)),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🗺 خريطة طريق الأبطال',
            style: t.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              for (int i = 0; i < _nodes.length; i++) ...[
                _PathNode(node: _nodes[i]),
                if (i != _nodes.length - 1)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Divider(
                        thickness: 3,
                        color: cs.primary.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
              ],
              const SizedBox(width: 10),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber),
                ),
                child: const Center(
                  child: Text('👑', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PathNode extends StatelessWidget {
  const _PathNode({required this.node});
  final _Node node;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: node.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: node.color.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(node.icon, color: Colors.white, size: 24),
    );
  }
}

class _Node {
  const _Node({required this.label, required this.color, required this.icon});
  final String label;
  final Color color;
  final IconData icon;
}

// بانر الهدف اليومي
class DailyGoalBanner extends StatelessWidget {
  const DailyGoalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cs.primary.withValues(alpha: 0.1),
              cs.surfaceContainerLowest,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cs.primary.withValues(alpha: 0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '🏆 هدفك اليومي: إتمام درسين',
                    style: t.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '50%',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 0.5),
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: value,
                    minHeight: 8,
                    backgroundColor: cs.surfaceContainerHighest,
                    color: cs.primary,
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
