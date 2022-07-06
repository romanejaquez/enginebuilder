import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/whistleitem.dart';
import 'package:build_engine_webapp/services/whistleservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhistlesWidget extends StatelessWidget {
  const WhistlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WhistleService>(
      builder: (context, wService, child) {

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
              const Text('WHISTLES',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(wService.whistles.length, (index) {

                WhistleItem whistle = wService.whistles[index];

                return GestureDetector(
                  onTap: () {
                    wService.setSelectedWhistle(whistle, context);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: wService.selectedWhistle != null && wService.selectedWhistle == whistle ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Icon(whistle.icon,
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