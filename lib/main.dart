import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/pages/createenginepage.dart';
import 'package:build_engine_webapp/pages/landingpage.dart';
import 'package:build_engine_webapp/pages/loadenginepage.dart';
import 'package:build_engine_webapp/pages/mainpage.dart';
import 'package:build_engine_webapp/pages/splash.dart';
import 'package:build_engine_webapp/services/actionsservice.dart';
import 'package:build_engine_webapp/services/audioservice.dart';
import 'package:build_engine_webapp/services/chimneyservice.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/facesservice.dart';
import 'package:build_engine_webapp/services/namenumberservice.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:build_engine_webapp/services/wheelsservice.dart';
import 'package:build_engine_webapp/services/whistleservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => AudioService(),
        ),
        Provider(
          create: (_) => ActionsService(),
        ),
        ChangeNotifierProvider(
          create: (_) => StepService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ColorService(),
        ),
        ChangeNotifierProvider(
          create: (_) => WheelsService(),
        ),
        ChangeNotifierProvider(
          create: (_) => WhistleService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChimneyService(),
        ),
        ChangeNotifierProvider(
          create: (_) => NameNumberService(),
        ),
        ChangeNotifierProvider(
          create: (_) => FacesService(),
        )
      ],
      child: const BuildEngineApp()
    )
  );
}

class BuildEngineApp extends StatelessWidget {
  const BuildEngineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Utils.mainApp,
      theme: ThemeData(
        fontFamily: 'DK Lemon Yellow Sun'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      //home: CreateEngine()
      routes: {
        "/" :(context) => const BuildEngineAppSplash(),
        "/main": (context) => const BuildEngineAppMain(),
        "/landing": (context) => const BuildEngineAppLanding(),
        "/create-engine": (context) => const CreateEngine(),
        "/load-engine": (context) => const LoadEngine()
      }
    );
  }
}
