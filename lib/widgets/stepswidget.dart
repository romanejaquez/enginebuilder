import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/step.model.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StepService>(
      builder: (context, service, child) {

        StepItem currentStep = service.getCurrentStep();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(service.steps.length, (index) {

                StepItem step = service.steps[index];

                return GestureDetector(
                  onTap: () {
                    if (step.isEnabled!) {
                      service.setCurrentStep(step);
                    }
                  },
                  child: MouseRegion(
                    cursor: service.isCurrentStep(step) || step.isEnabled! ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 5,
                          color: service.isCurrentStep(step) ? Colors.blueAccent : (step.isEnabled! || step.isCompleted! ? Utils.mainPurple : Colors.grey)
                        )
                      ),
                      alignment: Alignment.center,
                      child: Text(step.stepNumber!.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: service.isCurrentStep(step) ? Colors.blueAccent : (step.isEnabled! || step.isCompleted! ? Utils.mainPurple : Colors.grey)
                        )
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Text(currentStep.label!,
              style: const TextStyle(fontSize: 40, color: Utils.mainPurple)
            )
          ],
        );
      },
    );
  }
}