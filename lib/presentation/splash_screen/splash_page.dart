import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:the_academy_poker/utils/constants.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        Navigator.of(context).pushReplacementNamed(Constants.launcherRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildScreenBackGround(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(
                logo,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                scale: 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
