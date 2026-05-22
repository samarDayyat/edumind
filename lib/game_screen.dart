import 'package:flutter/material.dart';
import 'widgets/pressable_scale.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    // وجيهة مخصصة لبطاقات الإجابات تفاعلية ونابضة بالحياة
    Widget answer({
      required Color color,
      required String text,
      required IconData icon,
    }) {
      return PressableScale(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          // هنا يتم فحص الإجابة وتشغيل صوت فوز أو خسارة للبطل!
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withValues(alpha: 0.85)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.35),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: t.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Directionality(
      textDirection:
          TextDirection.rtl, // تفعيل الاتجاه العربي لسرعة استجابة الطفل
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '🎮 المرحلة الأولى',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.close_rounded,
              size: 28,
            ), // زر إغلاق التحدي بدلاً من السهم التقليدي ليناسب الألعاب
            onPressed: () => Navigator.maybePop(context),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: cs.secondary,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // لوحة الوقت الإنسيابية وعداد نقاط الـ XP الحماسي
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        cs.primaryContainer.withValues(alpha: 0.8),
                        cs.surface,
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      color: cs.primary.withValues(alpha: 0.15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: cs.shadow.withValues(alpha: 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.timer_rounded, color: cs.primary, size: 26),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '⏱️ الوقت المتبقي',
                              style: t.textTheme.labelLarge?.copyWith(
                                color: cs.onSurface,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // شريط تقدم حركي يعطي إحساساً بالوقت الفعلي
                            ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                value:
                                    0.65, // يمكن ربطه بـ AnimationController ليتناقص حياً
                                minHeight: 12,
                                backgroundColor: cs.surfaceContainerHighest,
                                color: const Color(
                                  0xFFEF4444,
                                ), // لون أحمر ناري للحماس
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // بطاقة الجائزة المتوهجة
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFF59E0B,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: const Color(0xFFF59E0B),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          '🏆 +15 نقطة',
                          style: t.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFFD97706),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // صندوق التحدي والسؤال الرياضي الكبير والمبهر للدماغ
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.elasticOut, // قفزة مبهجة تظهر السؤال بحماس
                  builder: (context, val, child) =>
                      Transform.scale(scale: val, child: child),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          cs.secondaryContainer.withValues(alpha: 0.4),
                          cs.surface,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: cs.secondary.withValues(alpha: 0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: cs.secondary.withValues(alpha: 0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('🧠', style: TextStyle(fontSize: 22)),
                            const SizedBox(width: 6),
                            Text(
                              'فكر واكتشف الجواب',
                              style: t.textTheme.labelLarge?.copyWith(
                                color: cs.secondary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'كم ناتج:  2 × 6 ؟',
                            style: t.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: cs.onSurface,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'اضغط على الإجابة الصحيحة لتسحق الوحش الفضائي! 👾',
                            textAlign: TextAlign.center,
                            style: t.textTheme.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // شبكة أزرار الإجابات التفاعلية المبهجة
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio:
                      2.0, // جعل الأزرار أكبر ومريحة لضغط أصابع الأطفال
                  children: [
                    answer(
                      color: const Color(0xFF7C3AED), // بنفسجي ساحر
                      text: '10',
                      icon: Icons.auto_awesome_rounded,
                    ),
                    answer(
                      color: const Color(0xFFF59E0B), // برتقالي ذهبي
                      text: '12',
                      icon: Icons.star_rounded,
                    ),
                    answer(
                      color: const Color(0xFF14B8A6), // فيروزي منعش
                      text: '14',
                      icon: Icons.wb_sunny_rounded,
                    ),
                    answer(
                      color: const Color(0xFFEF4444), // أحمر ناري
                      text: '16',
                      icon: Icons.local_fire_department_rounded,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // صندوق الحماس للمستقبل (مكافأة الأيام المتتالية)
                Container(
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      // أيقونة تهتز أو تلمع بشكل لطيف
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 0.05),
                        duration: const Duration(seconds: 1),
                        curve: Curves.elasticIn,
                        builder: (context, rot, child) => RotationTransition(
                          turns: AlwaysStoppedAnimation(rot),
                          child: child,
                        ),
                        child: const Text('🔥', style: TextStyle(fontSize: 22)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'مكافأة التتابع الحماسي: انتظر المفاجأة في المستوى القادم! 🎁',
                          style: t.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Icon(
                        Icons
                            .chevron_left_rounded, // سهم معكوس ليناسب الـ RTL العربي
                        color: cs.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
