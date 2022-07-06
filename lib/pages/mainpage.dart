import 'package:build_engine_webapp/widgets/enginebuilderheader.dart';
import 'package:build_engine_webapp/widgets/stepactionwidget.dart';
import 'package:flutter/material.dart';

class BuildEngineAppMain extends StatelessWidget {
  const BuildEngineAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/bg_img.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          const EngineBuilderHeader(),
          
        ],
      )
    );
  }
}