import 'package:calculadora/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
  Widget _introScreen() {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 7,
          title: Text(
            this.title,
            style: new TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff00bcd4),
              Color(0xff000000)
            ],
          ),
          navigateAfterSeconds: CalculatorPage(),
          loaderColor: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/icon.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}

