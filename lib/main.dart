import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_academy_poker/presentation/home_screen/home_page.dart';
import 'package:the_academy_poker/presentation/launcher_screen/launcher_page.dart';
import 'package:the_academy_poker/presentation/login_screen/login_page.dart';
import 'package:the_academy_poker/presentation/main_screen/main_page.dart';
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_page.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_page.dart';
import 'package:the_academy_poker/presentation/splash_screen/splash_page.dart';
import 'package:the_academy_poker/register_screen/register_page.dart';
import 'package:the_academy_poker/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(Poker());
  });
}

class Poker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The academy poker',
      home: SplashPage(),
      routes: {
        Constants.launcherRoute: (context) => LauncherPage(),
        Constants.loginRoute: (context) => LoginPage(),
        Constants.signUpRoute: (context) => SignUpPage(),
        Constants.resetPasswordRoute: (context) => ResetPasswordPage(),
        Constants.homeRoute: (context) => HomePage(),
        Constants.mainPage: (context) => MainPage(),
        Constants.registerPage: (context) => RegisterPage(),
      },
    );
  }
}
