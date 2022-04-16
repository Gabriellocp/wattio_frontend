import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/widgets/buttons/custom_button.dart';
import 'package:wattio_frontend/widgets/slider/circular_slider.dart';

class EnergyCalculator extends StatelessWidget {
  const EnergyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenHelper? screen = ScreenHelper(context: context);
    return FractionallySizedBox(
      widthFactor: screen.isWiderScreen ? .4 : 1,
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Economia de Energia',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircularSlider(
              maxValue: 50000,
              minValue: 1000,
              onChanged: (dynamic value) {},
              startAngle: -90,
            ),
            CustomButton(
              buttonText: 'Calcular',
              function: () {
                // ignore: avoid_print
              },
            )
          ],
        ),
      ),
    );
  }
}
