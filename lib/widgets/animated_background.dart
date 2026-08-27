import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _FloatingItem {
  final IconData icon;
  final double left;
  final double top;
  final double size;
  final double duration;
  final double opacity;

  _FloatingItem({
    required this.icon,
    required this.left,
    required this.top,
    required this.size,
    required this.duration,
    required this.opacity,
  });
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  final List<_FloatingItem> _items = [
    _FloatingItem(icon: Icons.phone_iphone, left: 0.08, top: 0.12, size: 46, duration: 4.5, opacity: 0.12),
    _FloatingItem(icon: Icons.mic, left: 0.78, top: 0.08, size: 38, duration: 3.8, opacity: 0.15),
    _FloatingItem(icon: Icons.graphic_eq, left: 0.15, top: 0.55, size: 34, duration: 5.2, opacity: 0.10),
    _FloatingItem(icon: Icons.mic_none, left: 0.85, top: 0.62, size: 42, duration: 4.0, opacity: 0.13),
    _FloatingItem(icon: Icons.smartphone, left: 0.65, top: 0.35, size: 30, duration: 3.5, opacity: 0.08),
    _FloatingItem(icon: Icons.podcasts, left: 0.05, top: 0.80, size: 36, duration: 4.8, opacity: 0.10),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = _items
        .map((item) => AnimationController(
              vsync: this,
              duration: Duration(milliseconds: (item.duration * 1000).round()),
            )..repeat(reverse: true))
        .toList();

    _animations = _controllers
        .map((c) => Tween<double>(begin: -12, end: 12).animate(
              CurvedAnimation(parent: c, curve: Curves.easeInOut),
            ))
        .toList();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: List.generate(_items.length, (i) {
            final item = _items[i];
            return AnimatedBuilder(
              animation: _animations[i],
              builder: (context, child) {
                return Positioned(
                  left: constraints.maxWidth * item.left,
                  top: constraints.maxHeight * item.top + _animations[i].value,
                  child: Opacity(
                    opacity: item.opacity,
                    child: Icon(
                      item.icon,
                      size: item.size,
                      color: const Color(0xFFB088FF),
                    ),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
