import 'package:flutter/material.dart';
import 'package:flutter_ripple_painter/painter/ripple_effect_painter.dart';

/// A customizable widget that creates animated ripple effects using custom painting
class RipplePainter extends StatefulWidget {
  /// Number of concurrent ripple waves
  final int numberOfWaves;

  /// Duration of one complete ripple animation cycle
  final Duration animationDuration;

  /// Color of the ripple waves
  final Color waveColor;

  /// Stroke width of the ripple circles
  final double strokeWidth;

  /// Maximum radius of the ripple as a percentage of the container width
  final double maxRadiusPercent;

  /// Base opacity of the ripples
  final double baseOpacity;

  /// Child widget to be painted over the ripple effect
  final Widget? child;

  /// Center point of the ripple effect relative to the container
  /// If null, ripples will be centered in the container
  final Alignment? alignment;

  /// Whether to clip the ripples to the bounds of the container
  final bool clipToBounds;

  /// Size of the container. If null, fills the available space
  final Size? size;

  const RipplePainter({
    super.key,
    this.numberOfWaves = 3,
    this.animationDuration = const Duration(seconds: 8),
    this.waveColor = Colors.white,
    this.strokeWidth = 2.0,
    this.maxRadiusPercent = 0.9,
    this.baseOpacity = 0.2,
    this.child,
    this.alignment,
    this.clipToBounds = true,
    this.size,
  });

  @override
  State<RipplePainter> createState() => _RipplePainterState();
}

class _RipplePainterState extends State<RipplePainter>
    with SingleTickerProviderStateMixin {
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget rippleWidget = AnimatedBuilder(
      animation: _rippleController,
      builder: (context, child) {
        return CustomPaint(
          size: widget.size ?? Size.infinite,
          painter: RippleEffectPainter(
            progress: _rippleController.value,
            numberOfWaves: widget.numberOfWaves,
            waveColor: widget.waveColor,
            strokeWidth: widget.strokeWidth,
            maxRadiusPercent: widget.maxRadiusPercent,
            baseOpacity: widget.baseOpacity,
            alignment: widget.alignment ?? Alignment.center,
          ),
        );
      },
    );

    if (widget.clipToBounds) {
      rippleWidget = ClipRect(child: rippleWidget);
    }

    return widget.size != null
        ? SizedBox.fromSize(
            size: widget.size,
            child: Stack(
              children: [
                rippleWidget,
                if (widget.child != null) Positioned.fill(child: widget.child!),
              ],
            ),
          )
        : Stack(
            children: [
              rippleWidget,
              if (widget.child != null) Positioned.fill(child: widget.child!),
            ],
          );
  }
}
