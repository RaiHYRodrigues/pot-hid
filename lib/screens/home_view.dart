import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../widgets/custom_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const HomeBody());
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: height * 0.15,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: widht * 0.1),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        height: height * 0.3,
      ),
      SizedBox(
        height: height * 0.15,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widht * 0.06),
        child: ButtonContainer(
          onPress: (() {
            Navigator.pushReplacementNamed(context, '/login');
          }),
          buttonColor: favoLight,
          title: 'Log In',
          titleColor: primaryColor,
        ),
      ),
      SizedBox(
        height: height * 0.05,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widht * 0.06),
        child: ButtonContainer(
          onPress: (() {
            Navigator.pushReplacementNamed(context, '/register');
          }),
          buttonColor: primaryColor,
          title: 'Criar Conta',
          titleColor: favoLight,
        ),
      )
    ]);
  }
}
