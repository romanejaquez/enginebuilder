import 'dart:math';

import 'package:build_engine_webapp/services/chimneyservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChimneyBuilder extends StatelessWidget {

  final double bottom;
  final double left;
  const ChimneyBuilder({Key? key, required this.bottom, required this.left }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChimneyService>(
      builder: (context, cService, child) {

        if (cService.selectedChimney != null) {

          return Positioned(
            bottom: bottom,
            left: left,
            right: 0,
            child: Image.asset('./assets/imgs/chimney/${cService.selectedChimney!.imgValue}.png',
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