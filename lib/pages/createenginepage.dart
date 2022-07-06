import 'package:build_engine_webapp/widgets/enginebuilderheader.dart';
import 'package:build_engine_webapp/widgets/enginebuilderwidget.dart';
import 'package:build_engine_webapp/widgets/stepactionwidget.dart';
import 'package:build_engine_webapp/widgets/stepswidget.dart';
import 'package:flutter/material.dart';

class CreateEngine extends StatelessWidget {
  const CreateEngine({Key? key}) : super(key: key);

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
          const StepsWidget(),
          const Align(
            alignment: Alignment.centerLeft,
            child: StepActionSelection()
          ),
          const Center(
            child: EngineBuilderWidget(),
          )
        ]
      )
    );
  }
}