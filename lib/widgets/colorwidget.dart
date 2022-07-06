import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/coloritem.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorService>(
      builder: (context, service, child) {
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
              const Text('COLORS',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(service.engineColors.length, (index) {

                ColorItem currentColor = service.engineColors[index];

                return GestureDetector(
                  onTap: () {
                    service.setSelectedColor(currentColor, context);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: service.selectedEngineColor != null && service.selectedEngineColor == currentColor ? Colors.blueAccent : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Container(
                        width: 25,
                        height: 25,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Utils.getColorFromEngineColor(currentColor.engineColor!),
                          borderRadius: BorderRadius.circular(20)
                        ),
                      )
                    ),
                  ),
                );
              })
            ],
          )
        );
      }
    );
  }
}