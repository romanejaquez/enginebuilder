import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/namenumberitem.dart';
import 'package:build_engine_webapp/services/namenumberservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameNumberWidget extends StatelessWidget {
  const NameNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NameNumberService>(
      builder: (context, nService, child) {

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
              const Text('FONTS',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(nService.nameNumberItems.length, (index) {

                NameNumberItem item = nService.nameNumberItems[index];

                return GestureDetector(
                  onTap: () {
                    nService.setSelectedNameNumberItem(item, context);
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
                          color: nService.selectedNameNumberItem != null && nService.selectedNameNumberItem == item ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(item.label!,
                          style: TextStyle(
                            fontFamily: item.fontName,
                            color: Utils.mainPurple, fontSize: 30)
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