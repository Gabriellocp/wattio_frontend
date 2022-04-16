import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/math_helper.dart';
import 'package:wattio_frontend/styles/colors.dart';

class BackgroundSliderPainter extends CustomPainter {
  BackgroundSliderPainter({
    required this.center,
    required this.backgroundRadius,
    required this.sweep,
    required this.start,
    required this.text,
  });
  final Offset center;
  double backgroundRadius;
  final double sweep;
  final double start;
  final String text;
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 30.0;
    double startAngle = start;
    // double radius1, radius2, diff;
    // Back circle (blue)
    Paint paint = Paint();
    paint.color = AppColors.bluePrimary;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    Paint handler = Paint();
    handler.color = AppColors.yellowPrimary;
    handler.style = PaintingStyle.stroke;
    handler.strokeCap = StrokeCap.round;
    handler.strokeWidth = strokeWidth;
    canvas.drawCircle(center, backgroundRadius, paint);
    paint.color = Colors.white;
    // Draw handler

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: backgroundRadius),
      startAngle,
      sweep,
      false,
      handler,
    );

    // Text inside the circle
    TextSpan span = TextSpan(
      text: text,
      style: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
    TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    // Defining the text offset >>
    // As it is built inside a "container"
    // Top-left is the origin (0,0), so we need to get it to always
    // Draw the text fixed on its center
    Offset centerText = Offset(
      (center.dx - textPainter.width / 2),
      (center.dy - textPainter.height / 2),
    );
    textPainter.paint(canvas, centerText);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
