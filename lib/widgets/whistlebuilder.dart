import 'package:build_engine_webapp/services/wheelsservice.dart';
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
            bottom: 150,
            left: 0,
            right: 0,
            child: Image.asset('./assets/imgs/whistles/${wService.selectedWhistle!.imgValue}.png',
              width: 140,
              height: 140,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}