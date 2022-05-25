import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pot_hid/firebase_options.dart';
import 'package:pot_hid/screens/calculator_view.dart';
import 'package:pot_hid/screens/home_view.dart';
import 'package:pot_hid/screens/login_view.dart';
import 'package:pot_hid/screens/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => Home(),
      '/calculator': (context) => Calculator(),
      '/login': (context) => LoginView(),
      '/register': (context) => RegisterView(),
    },
  ));
}
