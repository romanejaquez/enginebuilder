import 'package:build_engine_webapp/services/audioservice.dart';
import 'package:build_engine_webapp/services/whistleservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhistleBuilder extends StatelessWidget {
  const WhistleBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WhistleService>(
      builder: (context, wService, child) {

        if (wService.selectedWhistle != null) {
          double scaleValue = 1.0;

          return Positioned(
            bottom: 524,
            left: 460,
            child: GestureDetector(
              onTap: () {
                AudioService audioService = Provider.of<AudioService>(context, listen: false);
                audioService.playWhistleAudio(wService.selectedWhistle!.imgValue!);
              },
              child: StatefulBuilder(
                  builder: (context, setState) {
                  return MouseRegion(
                    onEnter: (event) => setState(() { scaleValue = 1.125; }),
                    onExit: (event) => setState(() { scaleValue = 1.0; }),
                    cursor: SystemMouseCursors.click,
                    child: AnimatedScale(
                      scale: scaleValue,
                      alignment: Alignment.bottomCenter,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Image.asset('./assets/imgs/whistles/${wService.selectedWhistle!.imgValue}.png',
                        width: 60,
                        height: 130,
                        fit: BoxFit.contain
                      ),
                    ),
                  );
                }
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}