import 'package:flutter/material.dart';
import 'package:wattio_frontend/data/stores/slider_store.dart';
import 'package:wattio_frontend/widgets/buttons/custom_button.dart';
import 'package:wattio_frontend/widgets/slider/circular_slider.dart';

class EnergyCalculator extends StatelessWidget {
  const EnergyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderStore store = SliderStore().getInstance();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Qual o valor médio mensal da sua conta?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircularSlider(
            maxValue: 50000,
            minValue: 1000,
            onChanged: (dynamic value) {
              store.actualValue = value;
            },
            startAngle: -90,
          ),
          CustomButton(
            buttonText: 'Calcular',
            function: () => store.getListOfBusiness(value: store.actualValue),
          )
        ],
      ),
    );
  }
}
