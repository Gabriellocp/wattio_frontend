import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/pages/mainPage/background.dart';
import 'package:wattio_frontend/pages/mainPage/energy_calculator.dart';
import 'package:wattio_frontend/pages/mainPage/list_overview.dart';

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
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: const [
        //     EnergyCalculator(),
        //     Expanded(
        //       child: ListOverview(),
        //     ),
        //   ],
        // ),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned.fromRect(
            rect: Rect.fromLTRB(
                screen.width / 4, 0, screen.width, screen.height * .8),
            child: const BackgroundImage(),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Flexible(
                  child: EnergyCalculator(),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: .8,
                    child: ListOverview(),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
