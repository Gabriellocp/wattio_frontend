import 'package:flutter/material.dart';

import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/widgets/slider/background_slider_painter.dart';
import 'package:wattio_frontend/widgets/slider/slider_painter.dart';

class CircularSlider extends StatelessWidget {
  const CircularSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    this.increment = 1,
    this.onChanged,
  }) : super(key: key);
  final num minValue;
  final num maxValue;
  final num increment;
  final Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = ScreenHelper(context: context);
    return screen.isBiggerScreen
        ? const Slider(value: 0.2, onChanged: null)
        : CustomPaint(
            size: screen.screenSize!,
//             size: Size(screen.width - 200, screen.height - 200),
            painter: const BackgroundSliderPainter(),
            foregroundPainter: const SliderPainter(
              start: -12.0,
              sweep: 100,
              end: 1000.0,
            ),
          );
  }
}
