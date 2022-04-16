import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/math_helper.dart';
import 'package:intl/intl.dart' as intl;
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
    required this.onChanged,
  }) : super(key: key);
  final int minValue;
  final int maxValue;
  double startAngle;
  final Function(dynamic) onChanged;

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  MathHelper mathHelper = MathHelper();
  Offset _dragOffset = Offset.zero;
  double sweep = 0.0;
  late int actualValue;
  late Offset handlerPosition;
  late Offset center;
  intl.NumberFormat nbformat = intl.NumberFormat('#,###.00', 'pt-BR');
  @override
  void initState() {
    super.initState();
    actualValue = widget.minValue.toInt();
  }

  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = ScreenHelper(context: context);
    return screen.isBiggerScreen
        ? const Slider(value: 0.2, onChanged: null)
        : LayoutBuilder(builder: (context, constraints) {
            double startInRadians = mathHelper.toRadian(widget.startAngle);
            double backgroundRadius = screen.isWiderScreen
                ? max(200, constraints.maxWidth * .25)
                : min(200, constraints.maxWidth * .3);
            center = Offset(
              constraints.maxWidth / 2,
              screen.height * .6 / 2,
            );
            handlerPosition = (center - const Offset(15, 15)) +
                Offset.fromDirection(
                  sweep + startInRadians,
                  backgroundRadius,
                );
            return Stack(clipBehavior: Clip.none, children: [
              CustomPaint(
                size: Size(constraints.maxWidth, screen.height * .7),
                painter: BackgroundSliderPainter(
                  center: center,
                  backgroundRadius: backgroundRadius,
                  sweep: sweep,
                  start: startInRadians,
                  text: 'R\$\n ${nbformat.format(actualValue)}',
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
                      int percentage = (sweep / (2 * pi) * 100).toInt();
                      actualValue = widget.minValue * (1 + percentage);

                      setState(() {});
                    },
                    child: const SliderHandler(),
                  ))
            ]);
          });
  }
}
