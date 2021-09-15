import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/app.dart';

void main() async {
  //Call this first to make sure we can make other system level calls safely
  WidgetsFlutterBinding.ensureInitialized();

  //
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // Only portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Init service locator
  await setupLocator();

  //
  runApp(const MyApp());
}

// https://www.didierboelens.com/fr/2018/06/web-sockets-cr%C3%A9er-un-jeu-en-temps-r%C3%A9el