import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/user_input.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.2),
          child: const MyAppBar(
            leftIcon: Icons.arrow_back,
            title: "Crie sua conta!",
            barElevation: 0,
          ),
        ),
        body: const SingleChildScrollView(child: RegisterBody()));
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Material(
      color: primaryColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: widht * 0.1),
          child: Container(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          height: height * 0.3,
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widht * 0.06),
          child: const UserInput(),
        ),
        SizedBox(
          height: height * 0.075,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widht * 0.06),
          child: ButtonContainer(
            onPress: (() {}),
            buttonColor: favoLight,
            title: 'Resgistrar',
            titleColor: primaryColor,
          ),
        ),
      ]),
    );
  }
}
