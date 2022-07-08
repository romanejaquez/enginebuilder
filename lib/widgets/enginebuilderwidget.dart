import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/facesservice.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:build_engine_webapp/services/wheelsservice.dart';
import 'package:build_engine_webapp/widgets/chimneybuilder.dart';
import 'package:build_engine_webapp/widgets/frontenginebuilder.dart';
import 'package:build_engine_webapp/widgets/namenumberdisplay.dart';
import 'package:build_engine_webapp/widgets/wheelsbuilder.dart';
import 'package:build_engine_webapp/widgets/whistlebuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EngineBuilderWidget extends StatelessWidget {
  const EngineBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StepService>(
      builder: (context, stepService, child) {
        
        if (stepService.currentStep!.stepNumber ==  6) {
          return RepaintBoundary(
            key: Utils.imgGlobalKey,
            child: const FrontEngineBuilder()
          );
        }
    
        return RepaintBoundary(
          key: Utils.imgGlobalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 1020,
                height: 800,
                child: Stack(
                  children: [
                    Consumer<ColorService>(
                      builder: (context, cService, child) {
                
                        String engineColor = cService.selectedEngineColor != null ? Utils.getEngineColorAsString(cService.selectedEngineColor!.engineColor!)
                        : 'none';
                
                        return Center(
                          child: Image.asset('./assets/imgs/body/$engineColor.png',
                            width: 830,
                          ),
                        );
                      },
                    ),
                    const NameNumberDisplay(),
                    const WheelsBuilder(),
                    Consumer<FacesService>(
                      builder: (context, fService, child) {
                        
                        if (fService.selectedEngineFace != null && fService.selectedEngineFace!.imgName != 'none') {
                          return Positioned(
                            top: 173,
                            left: 80,
                            child: Image.asset('./assets/imgs/faces/${fService.selectedEngineFace!.imgName}_side.png'));
                        }
                
                        return const SizedBox();
                      },
                    ),
                    const WhistleBuilder(),
                    const ChimneyBuilder(bottom: 519, left: 600),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}