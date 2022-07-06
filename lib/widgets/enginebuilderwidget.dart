import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/wheelsservice.dart';
import 'package:build_engine_webapp/widgets/chimneybuilder.dart';
import 'package:build_engine_webapp/widgets/wheelsbuilder.dart';
import 'package:build_engine_webapp/widgets/whistlebuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EngineBuilderWidget extends StatelessWidget {
  const EngineBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  width: 800,
                ),
              );
            },
          ),
          const WheelsBuilder(),
          const WhistleBuilder(),
          const ChimneyBuilder()
        ],
      ),
    );
  }
}