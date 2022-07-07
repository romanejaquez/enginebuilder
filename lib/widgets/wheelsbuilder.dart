import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/services/audioservice.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/wheelsservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WheelsBuilder extends StatefulWidget {
  const WheelsBuilder({Key? key}) : super(key: key);

  @override
  State<WheelsBuilder> createState() => _WheelsBuilderState();
}

class _WheelsBuilderState extends State<WheelsBuilder> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    )..repeat();
  }

  @override
  void dispose() {
    if (ctrl != null) {
      ctrl.dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<WheelsService>(
        builder: (context, wService, child) {

          if (wService.selectedWheelItem != null) {

            AudioService audioService = Provider.of<AudioService>(context, listen: false);
            audioService.playEngineAudio();

            return Consumer<ColorService>(
              builder: (context, cService, child) {
                String color = Utils.getEngineColorAsString(cService.selectedEngineColor!.engineColor!);
                WheelItem wheelItem = wService.selectedWheelItem!;
                return 
                
                Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return RotationTransition(
                        turns: Tween<double>(
                          begin: 0.0,
                          end: 1.0
                        ).animate(
                          CurvedAnimation(parent: ctrl, curve: Curves.linear)
                        ),
                        child: Image.asset('./assets/imgs/wheel/${wheelItem.imgValue}/$color.png',
                          width: 140,
                          height: 140,
                        ),
                      );
                    }),
                  ),
                );
              });
          }

          return const SizedBox();
        },
      );
  }
}