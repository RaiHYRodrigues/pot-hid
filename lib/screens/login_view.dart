import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../services/auth/firebase_auth_provider.dart';
import '../utilities/colors.dart';
import '../widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      appBar: LoginBar(),
      body: SingleChildScrollView(child: LoginBody()),
    );
  }
}

class LoginBar extends StatelessWidget with PreferredSizeWidget {
  const LoginBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
            alignment: Alignment.bottomRight,
            iconSize: height * 0.06,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: favoLight,
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Material(
      elevation: 0,
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
          child: Column(
            children: [
              Material(
                color: const Color(0xFFE0E0E0),
                child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        contentPadding: EdgeInsets.all(8))),
                shape: SmoothRectangleBorder(
                    side: const BorderSide(
                      color: favoLight,
                      width: 1,
                    ),
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 25, cornerSmoothing: 0.5)),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Material(
                color: const Color(0xFFE0E0E0),
                child: TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Senha',
                        contentPadding: EdgeInsets.all(8))),
                shape: SmoothRectangleBorder(
                    side: const BorderSide(
                      color: favoLight,
                      width: 1,
                    ),
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 25, cornerSmoothing: 0.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.075,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widht * 0.06, vertical: widht * 0.06),
          child: ButtonContainer(
            onPress: () async {
              final email = _email.text;
              final password = _password.text;
              await FirebaseAuthProvider()
                  .logIn(email: email, password: password);
            },
            titleColor: primaryColor,
            title: "Log In",
            buttonColor: favoLight,
          ),
        ),
      ]),
    );
  }
}
