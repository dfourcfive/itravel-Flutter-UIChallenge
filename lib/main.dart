import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itravel/Utilites/constants.dart';
import 'package:itravel/screens/HomeScreen.dart';
import 'package:itravel/screens/OnBoarding/onBoardingScreen.dart';
import 'package:itravel/screens/SignUpScreen.dart';
import 'package:itravel/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: ThemeProvider(
        initTheme: kDarkTheme,
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeProvider.of(context),
              home: OnboardingScreen(),
            );
          },
        ),
      ),
    );
  }
}
