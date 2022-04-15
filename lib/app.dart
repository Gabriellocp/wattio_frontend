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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Economia de Energia',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: CircularSlider(
                      minValue: 1000,
                      maxValue: 3000,
                    ),
                  ),
                  CustomButton(
                    buttonText: 'Calcular',
                    function: () {
                      // ignore: avoid_print
                      print('Teste');
                    },
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
