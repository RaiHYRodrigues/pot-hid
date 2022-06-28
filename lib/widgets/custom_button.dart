import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class ButtonContainer extends StatelessWidget {
  late final String title;
  late final Color buttonColor;
  late final Color titleColor;
  late final VoidCallback onPress;
  ButtonContainer(
      {required this.title,
      required this.buttonColor,
      required this.titleColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onPress,
      child: Ink(
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0,
              ),
            ],
            color: buttonColor,
            shape: SmoothRectangleBorder(
                side: const BorderSide(
                  color: favoDark,
                  width: 0.5,
                ),
                borderRadius:
                    SmoothBorderRadius(cornerRadius: 25, cornerSmoothing: 0.5)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: titleColor),
            ),
          ),
          width: height * 0.35,
          height: height * 0.08),
    );
  }
}
