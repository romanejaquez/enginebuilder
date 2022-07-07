import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/enginefaceitem.dart';
import 'package:build_engine_webapp/services/facesservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacesWidget extends StatelessWidget {
  const FacesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FacesService>(
      builder: (context, fService, child) {

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
              const Text('Faces',
                style: TextStyle(color: Utils.mainPurple, fontSize: 20)
              ),
              const SizedBox(height: 20),
              ...List.generate(fService.faces.length, (index) {

                EngineFaceItem faceItem = fService.faces[index];

                return GestureDetector(
                  onTap: () {
                    fService.setSelectedEngineFace(faceItem, context);
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
                          color: fService.selectedEngineFace != null && fService.selectedEngineFace == faceItem ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Icon(faceItem.icon,
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