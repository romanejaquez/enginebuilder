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

          return Positioned(
            bottom: 513,
            left: -30,
            right: 0,
            child: GestureDetector(
              onTap: () {
                AudioService audioService = Provider.of<AudioService>(context, listen: false);
                audioService.playWhistleAudio(wService.selectedWhistle!.imgValue!);
              },
              child: Image.asset('./assets/imgs/whistles/${wService.selectedWhistle!.imgValue}.png',
                width: 140,
                height: 140,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}