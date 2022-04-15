import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wattio_frontend/context/global_context.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/styles/colors.dart';

class BackgroundSliderPainter extends CustomPainter {
  const BackgroundSliderPainter();
  @override
  void paint(Canvas canvas, Size size) {
    double heightCorrector, backgroundRadius, mainLayerRadius;
    // double radius1, radius2, diff;
    // Back circle (blue)
    Paint paint = Paint();
    paint.color = AppColors.bluePrimary;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;

    backgroundRadius = size.height * .25;
    heightCorrector = 100;
    canvas.drawCircle(
        Offset(
          size.width / 2,
          size.height / 2 - backgroundRadius + heightCorrector,
        ),
        backgroundRadius,
        paint);
    paint.color = Colors.white;

    mainLayerRadius = size.height * .24;
    canvas.drawCircle(
        Offset(
          size.width / 2,
          size.height / 2 -
              mainLayerRadius -
              (backgroundRadius - mainLayerRadius) +
              heightCorrector,
        ),
        mainLayerRadius,
        paint); // Text inside the circle
    TextSpan span = const TextSpan(
      text: 'Teste',
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
    TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    // Defining the text offset >>
    // As it is built inside a "container"
    // Top-left is the origin (0,0), so we need to get it to always
    // Draw the text fixed on its center
    Offset centerText = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2 -
          backgroundRadius +
          heightCorrector,
    );
    textPainter.paint(canvas, centerText);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
