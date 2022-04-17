import 'package:flutter/material.dart';
import 'package:wattio_frontend/data/infos.dart';
import 'package:wattio_frontend/data/stores/slider_store.dart';
import 'package:wattio_frontend/widgets/buttons/custom_button.dart';
import 'package:wattio_frontend/widgets/cards/business_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListOverview extends StatelessWidget {
  const ListOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderStore sliderStore = SliderStore().getInstance();
    return Observer(builder: (_) {
      return Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: ScrollController(),
            itemBuilder: (context, index) {
              return Center(
                  child: Wrap(children: [
                BusinessCard(data: sliderStore.businessList[index])
              ]));
            },
            itemCount: sliderStore.businessList.length,
          )),
          if (sliderStore.businessList.isNotEmpty)
            const CustomButton(buttonText: 'Contratar')
        ],
      );
    });
  }
}
