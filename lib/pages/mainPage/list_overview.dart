import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListOverview extends StatelessWidget {
  const ListOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: SvgPicture.asset(
          "images/background_image.svg",
          color: Colors.white.withOpacity(0.4),
          colorBlendMode: BlendMode.modulate,
        ),
      )
    ]);
  }
}
