import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wattio_frontend/context/global_context.dart';
import 'package:wattio_frontend/helpers/math_helper.dart';

import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/widgets/slider/background_slider_painter.dart';
import 'package:wattio_frontend/widgets/slider/slider_painter.dart';

// ignore: must_be_immutable
class CircularSlider extends StatefulWidget {
  CircularSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.startAngle,
    this.increment = 1,
    required this.onChanged,
  }) : super(key: key);
  final double minValue;
  final double maxValue;
  final double increment;
  double startAngle;
  final Function(dynamic) onChanged;

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  MathHelper mathHelper = MathHelper();
  Offset _dragOffset = Offset.zero;
  double sweep = 0.0;
  late double totalAngle;
  late Offset handlerPosition;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = ScreenHelper(context: context);
    return screen.isBiggerScreen
        ? const Slider(value: 0.2, onChanged: null)
        : LayoutBuilder(builder: (context, constraints) {
            double startInRadians = mathHelper.toRadian(widget.startAngle);
            double backgroundRadius = screen.isWiderScreen
                ? max(150, constraints.maxWidth * .2)
                : max(150, constraints.maxWidth * .3);
            Offset center = Offset(
              constraints.maxWidth / 2,
              screen.height * .6 / 2,
            );
            handlerPosition = (center - const Offset(15, 15)) +
                Offset.fromDirection(
                  sweep + startInRadians,
                  backgroundRadius,
                );
            totalAngle = mathHelper.toRadian(269);
            return Stack(children: [
              CustomPaint(
                size: Size(constraints.maxWidth, screen.height * .7),
                painter: BackgroundSliderPainter(
                  center: center,
                  backgroundRadius: backgroundRadius,
                  sweep: sweep,
                  start: startInRadians,
                  text: 'R\$\n${sweep.toStringAsFixed(6)}',
                ),
              ),
              Positioned(
                  top: handlerPosition.dy,
                  left: handlerPosition.dx,
                  child: GestureDetector(
                    onPanStart: (details) {
                      RenderBox renderHandler =
                          context.findRenderObject() as RenderBox;
                      _dragOffset =
                          renderHandler.globalToLocal(details.globalPosition);
                    },
                    onPanUpdate: (details) {
                      Offset previousOffset = _dragOffset;
                      _dragOffset += details.delta;
                      double newAngle = sweep +
                          mathHelper.toAngle(_dragOffset, center) -
                          mathHelper.toAngle(previousOffset, center);
                      sweep = mathHelper.normalizeAngle(newAngle);
                      widget.onChanged(1);
                      setState(() {});
                    },
                    child: const SliderHandler(),
                  ))
            ]);
          });
  }
}
