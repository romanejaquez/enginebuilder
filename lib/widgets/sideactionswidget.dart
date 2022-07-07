import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/sideoption.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideActionsWidget extends StatelessWidget {
  const SideActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StepService>(
      builder: (context, stepService, child) {

        bool enableButtons = stepService.steps.every((s) => s.isEnabled!);
        Color buttonColorAndBorder = enableButtons ? Utils.mainPurple : Colors.grey.withOpacity(0.5);

        return Container(
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
            Utils.getSideOptions().length, (index) {

              SideOption option = Utils.getSideOptions()[index];

              return GestureDetector(
                onTap: enableButtons ? () {} : null,
                child: MouseRegion(
                  cursor: enableButtons ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 75,
                        height: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: buttonColorAndBorder,
                            width: 5
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0.0, -1.0)
                            )
                          ]
                        ),
                        child: Icon(
                          option.icon!,
                          size: 40,
                          color: buttonColorAndBorder
                        )
                      ),
                      Text(option.label!,
                        style: TextStyle(
                          color: buttonColorAndBorder,
                          fontSize: 20
                        )
                      ),
                      const SizedBox(height: 40)
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }
    );
  }
}