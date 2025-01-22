import 'package:flutter/material.dart';

class RippleEffectPainter extends CustomPainter {
  final double progress;
  final int numberOfWaves;
  final Color waveColor;
  final double strokeWidth;
  final double maxRadiusPercent;
  final double baseOpacity;
  final Alignment alignment;

  RippleEffectPainter({
    required this.progress,
    required this.numberOfWaves,
    required this.waveColor,
    required this.strokeWidth,
    required this.maxRadiusPercent,
    required this.baseOpacity,
    required this.alignment,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final double maxRadius = size.width * maxRadiusPercent;
    final Offset center = alignment.alongSize(size);

    for (int i = 0; i < numberOfWaves; i++) {
      final double localProgress = (progress + i * (1 / numberOfWaves)) % 1;
      final double radius = localProgress * maxRadius;

      double opacity = 1.0 - (radius / maxRadius);
      opacity = opacity.clamp(0.0, 1.0);
      paint.color = waveColor.withAlpha((opacity * baseOpacity * 255).toInt());

      if (opacity > 0) {
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant RippleEffectPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.numberOfWaves != numberOfWaves ||
        oldDelegate.waveColor != waveColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.maxRadiusPercent != maxRadiusPercent ||
        oldDelegate.baseOpacity != baseOpacity ||
        oldDelegate.alignment != alignment;
  }
}
