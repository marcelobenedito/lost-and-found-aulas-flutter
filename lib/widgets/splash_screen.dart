import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenWidget extends StatelessWidget {
  
  final Widget navigateAfterSeconds;

  SplashScreenWidget(this.navigateAfterSeconds);
  
  @override
  Widget build(BuildContext context) {
    return _introScreen(navigateAfterSeconds);
  }

  Widget _introScreen(Widget navigateAfterSeconds) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(Colors.yellow[500].value),
            Color(Colors.amber[700].value)
          ],
        ),
        navigateAfterSeconds: navigateAfterSeconds,
        loaderColor: Colors.white54,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/res/mipmap-xxxhdpi/lost_and_found_logo.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
}