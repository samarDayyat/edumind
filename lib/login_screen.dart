import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // استيراد حزمة الحركة
import 'edumind_root.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _goHome(BuildContext context) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(builder: (context) => const EduMindRoot()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    // تعريف الألوان الخاصة بالخوارزمي بالطابع السوري
    const syrianPurple = Color(0XFF8E24AA); // لون نهدي مميز
    const syrianOrange = Color(0xFFFF9800); // لون برتقالي دافئ

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1. خلفية متحركة بلطف عند الدخول
            Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.15),
                          Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.05),
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                    ),
                  ),
                )
                .animate()
                .fadeIn(duration: 800.ms)
                .scale(begin: const Offset(1.1, 1.1)),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  // 2. الهيكل التفاعلي للخوارزمي (تأثير الطفو والبروز)
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // الدائرة الخلفية باللون النهدي والبرتقالي
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.4),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                          ),
                          // صورة الخوارزمي تبرز وتطفو (تتحرك للأعلى والأسفل بشكل مستمر)
                          Positioned(
                            top: 0,
                            child:
                                Image.asset(
                                      'assets/images/ope.png', // مسار صورتك الشفافة
                                      height: 185,
                                      fit: BoxFit.contain,
                                    )
                                    .animate(
                                      onComplete: (controller) =>
                                          controller.repeat(reverse: true),
                                    )
                                    .moveY(
                                      begin: 0,
                                      end: -10,
                                      duration: 2.seconds,
                                      curve: Curves.easeInOut,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().scale(
                    delay: 100.ms,
                    duration: 500.ms,
                    curve: Curves.bounceOut,
                  ),

                  const SizedBox(height: 16),

                  // 3. بطاقة الترحيب (تأثير الدخول المتدرج)
                  Card(
                        elevation: 4,
                        shadowColor: cs.shadow.withValues(alpha: 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                cs.primaryContainer.withValues(alpha: 0.3),
                                cs.surface,
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                'أهلاً بك في رحلة اللعب والتحدي ! 👋',
                                style: t.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'هل أنت مستعد لخوض هذه المغامرة الشيّقة ؟',
                                style: t.textTheme.bodyMedium?.copyWith(
                                  color: cs.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms)
                      .moveY(begin: 30, end: 0),

                  const SizedBox(height: 16),

                  // 4. بطاقة مدخلات البيانات والأزرار التفاعلية
                  Card(
                        elevation: 5,
                        shadowColor: cs.shadow.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'البريد الإلكتروني',
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'كلمة المرور',
                                  prefixIcon: Icon(
                                    Icons.lock_rounded,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),

                              // === [تعديل جديد]: زر هل نسيت كلمة السر؟ ===
                              const SizedBox(height: 6),
                              Align(
                                alignment: AlignmentDirectional
                                    .centerEnd, // لمحاذاة النص لليسار في واجهات RTL
                                child: TextButton(
                                  onPressed: () {
                                    // هنا تضع كود الانتقال لصفحة استعادة كلمة السر
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    foregroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  child: const Text(
                                    'هل نسيت كلمة السر؟',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // زر "متابعة" النابض بشكل مستمر لجذب عين الطالب
                              FilledButton(
                                    onPressed: () => _goHome(context),
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary, // برتقالي جاذب ومحمس للأطفال
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(
                                        double.infinity,
                                        58,
                                      ),
                                      elevation: 4,
                                      shadowColor: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withValues(alpha: 0.4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(26),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'انطلق الآن',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  )
                                  .animate(
                                    onComplete: (controller) =>
                                        controller.repeat(reverse: true),
                                  )
                                  .scale(
                                    begin: const Offset(1.0, 1.0),
                                    end: const Offset(1.03, 1.03),
                                    duration: 1.2.seconds,
                                    curve: Curves.easeInOut,
                                  ),

                              const SizedBox(height: 14),

                              // زر الدخول كـ زائر بتأثير هز خفيف عند الظهور
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 52),
                                  foregroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                    side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.5),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                onPressed: () => _goHome(context),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.celebration_rounded, size: 22),
                                    SizedBox(width: 10),
                                    Text(
                                      'جرب كـ ضيف استكشافي',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ).animate().shake(
                                delay: 600.ms,
                                duration: 500.ms,
                              ),

                              // === [تعديل جديد]: خيار إنشاء حساب جديد ===
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ليس لديك حساب؟ ',
                                    style: TextStyle(
                                      color: cs.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // هنا تضع كود الانتقال لصفحة إنشاء الحساب الجديد
                                    },
                                    child: Text(
                                      'أنشئ حساباً الآن',
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        decoration: TextDecoration
                                            .underline, // لإبراز الرابط بصرياً
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 400.ms)
                      .moveY(begin: 40, end: 0),

                  const SizedBox(height: 20),

                  // 5. الملاحظة السفلية تظهر بهدوء
                  Text(
                    'يدعم واجهات اللغة العربية والانتقال السلس (RTL) بالكامل.',
                    textAlign: TextAlign.center,
                    style: t.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn(delay: 700.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
