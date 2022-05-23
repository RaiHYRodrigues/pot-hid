import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final double barElevation;
  final IconData? leftIcon;
  final Function? leftPress;
  final IconData? rightIcon;
  final Function? rightPress;

  const MyAppBar(
      {required this.title,
      required this.barElevation,
      required this.leftIcon,
      this.leftPress,
      this.rightIcon,
      this.rightPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    {
      if (rightIcon != null) {
        return Material(
          elevation: barElevation,
          child: Container(
            height: height * 0.15,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                widht * 0.03, height * 0.05, widht * 0.03, height * 0.02),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Icon(
                      leftIcon,
                      color: favoLight,
                      size: height * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: widht * 0.03,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: favoDark,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Icon(
                      rightIcon,
                      color: favoLight,
                      size: height * 0.06,
                    ),
                  ),
                ]),
          ),
        );
      } else {
        return Material(
          elevation: barElevation,
          child: Container(
            height: height * 0.15,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                widht * 0.03, height * 0.05, widht * 0.03, height * 0.02),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Icon(
                      leftIcon,
                      color: favoLight,
                      size: height * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: widht * 0.03,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: favoDark,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ]),
          ),
        );
      }
    }
  }
}
