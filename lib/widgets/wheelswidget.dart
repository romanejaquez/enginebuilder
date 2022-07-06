import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/coloritem.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/services/colorservice.dart';
import 'package:build_engine_webapp/services/wheelsservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WheelsWidget extends StatelessWidget {
  const WheelsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WheelsService>(
      builder: (context, service, child) {

        ColorItem selectedColor = Provider.of<ColorService>(context, listen: false).selectedEngineColor as ColorItem;
        
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
              const Text('WHEELS',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(service.wheels.length, (index) {

                WheelItem wheelItem = service.wheels[index];

                return GestureDetector(
                  onTap: () {
                    service.setSelectedWheelItem(wheelItem, context);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: service.selectedWheelItem != null && service.selectedWheelItem == wheelItem ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Icon(wheelItem.icon,
                          size: 50,
                          color: Utils.mainPurple,
                        )
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