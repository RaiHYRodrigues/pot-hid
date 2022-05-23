import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserCredState();
}

class _UserCredState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Material(
          color: Color(0xFFE0E0E0),
          child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  contentPadding: EdgeInsets.all(8))),
          shape: SmoothRectangleBorder(
              side: const BorderSide(
                color: favoLight,
                width: 1,
              ),
              borderRadius:
                  SmoothBorderRadius(cornerRadius: 25, cornerSmoothing: 0.5)),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Material(
          color: Color(0xFFE0E0E0),
          child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Senha',
                  contentPadding: EdgeInsets.all(8))),
          shape: SmoothRectangleBorder(
              side: const BorderSide(
                color: favoLight,
                width: 1,
              ),
              borderRadius:
                  SmoothBorderRadius(cornerRadius: 25, cornerSmoothing: 0.5)),
        ),
      ],
    );
  }
}
