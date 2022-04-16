import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/widgets/buttons/custom_button.dart';
import 'package:wattio_frontend/widgets/slider/circular_slider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenHelper? screen = ScreenHelper(context: context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screen.height * 0.05,
          horizontal: screen.width * 0.05,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: !screen.isWiderScreen ? .4 : 1,
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
            ),
          ),
        ]),
      ),
    );
  }
}
