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

          double scaleValue = 1.0;

          return Positioned(
            bottom: bottom,
            left: left,
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
                    child: Image.asset('./assets/imgs/chimney/${cService.selectedChimney!.imgValue}.png',
                      width: 140,
                      height: 140,
                    ),
                  )
                );
              }
            )
          );
        }

        return const SizedBox();
      },
    );
  }
}