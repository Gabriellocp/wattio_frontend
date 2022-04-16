import 'package:flutter/material.dart';
import 'package:wattio_frontend/data/infos.dart';
import 'package:wattio_frontend/widgets/buttons/custom_button.dart';
import 'package:wattio_frontend/widgets/cards/business_card.dart';

class ListOverview extends StatelessWidget {
  const ListOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemBuilder: (context, index) {
              return BusinessCard(data: infos[index]);
            },
            itemCount: infos.length,
          ),
        ),
        const CustomButton(buttonText: 'Contratar')
      ],
    );
  }
}
