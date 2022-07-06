import 'dart:async';

import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:flutter/material.dart';

class BuildEngineAppSplash extends StatefulWidget {
  const BuildEngineAppSplash({Key? key}) : super(key: key);

  @override
  State<BuildEngineAppSplash> createState() => _BuildEngineAppSplashState();
}

class _BuildEngineAppSplashState extends State<BuildEngineAppSplash> {

  late Timer delay;

  @override 
  void dispose() {
    if (delay != null) {
      delay.cancel();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    delay = Timer(const Duration(seconds: 3), () {
      Utils.mainApp.currentState!.pushReplacementNamed('/landing');
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Utils.mainPurple,
                    Utils.secondaryPurple
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation(Colors.white.withOpacity(0.25)),
              )
            )
          ),
          Center(
            child: Icon(EngineBuilderFonts.engineBuilderLogo, size: 100, color: Colors.white)
          )
        ],
      )
    );
  }
}