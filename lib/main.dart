import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/modules/tictactoe/TicTacToe.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          fontFamily: 'VarelaRound',
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blueGrey.shade700,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blueGrey.shade700,
              ))),
      home: EasySplashScreen(
        logo: Image.asset(
            'images/xo.png',
        ),
        title: const Text(
          'Welcome to TIC TAC TOE',
          style:  TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        showLoader: true,
        loaderColor: Colors.blue.shade800,
        loadingText: const Text(
            'Loading...',
          style: TextStyle(
             fontSize: 19.0,
             fontWeight: FontWeight.bold,
          ),
        ),
        navigator: const TicTacToe(),
        logoWidth: 100.0,
        durationInSeconds: 4,
      ),
    );
  }
}
