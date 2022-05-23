import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/my_appbar.dart';
import '../widgets/user_input.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.2),
        child: const MyAppBar(
          leftIcon: Icons.arrow_back,
          barElevation: 0,
          title: "Bem vindo de volta!",
        ),
      ),
      body: const SingleChildScrollView(child: const LoginBody()),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
            onPress: () {},
            titleColor: primaryColor,
            title: "Log In",
            buttonColor: favoLight,
          ),
        ),
      ]),
    );
  }
}
