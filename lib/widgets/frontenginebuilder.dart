import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/services/chimneyservice.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/facesservice.dart';
import 'package:build_engine_webapp/widgets/chimneybuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrontEngineBuilder extends StatelessWidget {
  const FrontEngineBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorService>(
      builder: (context, colorService, child) {
        
        return Consumer<ChimneyService>(
          builder: (context, chimneyService, child) {
            
            return Consumer<FacesService>(
              builder: (context, facesService, child) {

                String engineColor = colorService.selectedEngineColor != null ? Utils.getEngineColorAsString(colorService.selectedEngineColor!.engineColor!)
                  : 'none';

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset('./assets/imgs/bodyfront/$engineColor.png', width: 450),
                    const ChimneyBuilder(bottom: 420, left: 10),
                    Positioned(
                      top: 122,
                      left: 8,
                      right: 0,
                      child: Image.asset(
                        './assets/imgs/faces/${facesService.selectedEngineFace!.imgName}.png', 
                        width: 210, height: 210)
                      ),
                  ]
                );
              },
            );
          }
        );
      }
    );
  }
}