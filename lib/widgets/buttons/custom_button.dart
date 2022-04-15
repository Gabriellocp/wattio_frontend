import 'package:flutter/material.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/styles/colors.dart';

class CustomButton extends StatelessWidget {
  /// Creates a button with custom text and custom functionalitty
  const CustomButton({
    Key? key,
    required this.buttonText,
    this.function,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = ScreenHelper(context: context);
    BorderRadius borderRadius = BorderRadius.circular(20);
    double buttonWidth =
        screen.isWiderScreen ? screen.width * .8 : screen.width * .3;
    double fontSize = 32.0;
    return Material(
      color: AppColors.yellowPrimary,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: function,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            constraints: BoxConstraints(
              maxWidth: buttonWidth,
              minHeight: fontSize * 2.0,
            ),
            child: Center(
              child: Text(
                buttonText.toUpperCase(),
                maxLines: 1,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
