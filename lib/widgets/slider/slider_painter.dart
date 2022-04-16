import 'package:flutter/material.dart';
import 'package:wattio_frontend/styles/colors.dart';

class SliderHandler extends StatelessWidget {
  const SliderHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: AppColors.bluePrimary,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.yellowPrimary, width: 5.0),
      ),
    );
  }
}
