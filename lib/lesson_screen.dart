import 'package:flutter/material.dart';

/// Gamified lesson view — wire with [Navigator] or routes (no changes to [main.dart] required here).
class LessonScreen extends StatelessWidget {
  const LessonScreen({
    super.key,
    this.lessonTitle = 'Adding rational numbers',
    this.explanation =
        'Same-sized pieces first: find a denominator both fractions can use, then add the numerators on top. You\'ve got this—we\'ll practice next!',
    this.exampleText = 'Example:  ¼ + ¼ = ²⁄₄ = ½',
  });

  final String lessonTitle;
  final String explanation;
  final String exampleText;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.maybePop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        title: Text(lessonTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    size: 28,
                    color: cs.secondary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'New skill',
                    style: t.textTheme.labelLarge?.copyWith(
                      color: cs.secondary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cs.primaryContainer.withValues(alpha: 0.85),
                      cs.surface.withValues(alpha: 0.92),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: cs.shadow.withValues(alpha: 0.12),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.6),
                  ),
                ),
                padding: const EdgeInsets.all(18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: cs.primary,
                          child: const Text(
                            '🤖',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Edu',
                          style: t.textTheme.labelSmall?.copyWith(
                            color: cs.onSurfaceVariant,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        explanation,
                        style: t.textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _Chip(text: '🏆 +20 XP', color: cs.secondary),
                  _Chip(text: '⭐ Easy', color: cs.tertiary),
                  _Chip(text: '⏱️ 1 min', color: cs.primary),
                ],
              ),
              const SizedBox(height: 22),
              Text(
                'Here\'s an example',
                style: t.textTheme.titleSmall?.copyWith(
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        cs.primaryContainer.withValues(alpha: 0.8),
                        cs.secondaryContainer.withValues(alpha: 0.6),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: cs.secondary.withValues(alpha: 0.45),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: cs.shadow.withValues(alpha: 0.12),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Text(
                      exampleText,
                      style: t.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _BigCta(text: 'Try it', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        text,
        style: t.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w900,
          color: cs.onSurface,
        ),
      ),
    );
  }
}

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
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.98 : 1,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        child: FilledButton(
          onPressed: widget.onTap,
          style: FilledButton.styleFrom(
            backgroundColor: cs.secondary,
            foregroundColor: cs.onSecondary,
            minimumSize: const Size(double.infinity, 58),
            elevation: 4,
            shadowColor: cs.shadow.withValues(alpha: 0.26),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text),
              const SizedBox(width: 10),
              const Icon(Icons.play_arrow_rounded, size: 26),
            ],
          ),
        ),
      ),
    );
  }
}
