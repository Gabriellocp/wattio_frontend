import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wattio_frontend/styles/colors.dart';

class SliderPainter extends CustomPainter {
  const SliderPainter({
    required this.start,
    required this.end,
    required this.sweep,
  });
  final double start;
  final double end;
  final double sweep;
  @override
  void paint(Canvas canvas, Size size) {
    double heightCorrector, backgroundRadius, correctedHeight;
    backgroundRadius = size.height * .25;
    heightCorrector = 100;
    correctedHeight = backgroundRadius - heightCorrector;
    if (start == 0.0 && end == 0.0) {
      return;
    }
    Paint progressPainter = Paint();
    progressPainter.color = Colors.transparent;

    Offset center = Offset(
      size.width / 2,
      size.height / 2 - correctedHeight,
    );
    // double radius = min(size.width / 2, size.height / 2);
    // canvas.drawArc(
    //   Rect.fromCircle(
    //     center: center,
    //     radius: radius,
    //   ),
    //   pi / 2 + start,
    //   sweep,
    //   false,
    //   progressPainter,
    // );

    canvas.drawCircle(
        Offset(
          size.width / 2,
          size.height / 2 - correctedHeight,
        ),
        backgroundRadius * .98,
        progressPainter);

    // Drawing the slider's handler
    Paint handler = Paint();
    handler.color = AppColors.textPrimary;
    handler.strokeCap = StrokeCap.round;

    Offset handlerPosition = Offset(
      center.dx + backgroundRadius * cos(-pi / 2 + start),
      center.dy + backgroundRadius * sin(-pi / 2 + start),
    );
    canvas.drawCircle(
      handlerPosition,
      20.0,
      handler,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
