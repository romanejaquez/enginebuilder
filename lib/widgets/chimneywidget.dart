import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/chimneyitem.dart';
import 'package:build_engine_webapp/services/chimneyservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChimneyWidget extends StatelessWidget {
  const ChimneyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChimneyService>(
      builder: (context, cService, child) {

        return Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 5,
              color: Utils.mainPurple
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('CHIMNEYS',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(cService.chimneys.length, (index) {

                ChimneyItem chimney = cService.chimneys[index];

                return GestureDetector(
                  onTap: () {
                    cService.setSelectedChimney(chimney, context);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: cService.selectedChimney != null && cService.selectedChimney == chimney ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Icon(chimney.icon,
                          size: 60,
                          color: Utils.mainPurple,
                        )
                      )
                    ),
                  ),
                );
              })
            ]
          )
        );
      }
    );
  }
}