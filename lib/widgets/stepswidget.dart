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
                double stepCircleDimensions = service.isCurrentStep(step) ? 70 : 50;
                Color stepCircleLabelColor = service.isCurrentStep(step) ? Colors.white : (step.isEnabled! || step.isCompleted! ? Utils.mainPurple : Colors.grey);
                Color stepCircleBorderColor = service.isCurrentStep(step) ? Colors.transparent : (step.isEnabled! || step.isCompleted! ? Utils.mainPurple : Colors.grey);
                double stepBorderSize = service.isCurrentStep(step) ? 7 : 5;
                Color stepFillColor = service.isCurrentStep(step) ? Colors.blueAccent : Colors.white;
                double stepCircleFontSize = service.isCurrentStep(step) ? 40 : 30;

                return GestureDetector(
                  onTap: () {
                    if (step.isEnabled!) {
                      service.setCurrentStep(step);
                    }
                  },
                  child: MouseRegion(
                    cursor: service.isCurrentStep(step) || step.isEnabled! ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
                    child: Container(
                      width: stepCircleDimensions,
                      height: stepCircleDimensions,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: stepFillColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: stepBorderSize,
                          color: stepCircleBorderColor
                        )
                      ),
                      alignment: Alignment.center,
                      child: Text(step.stepNumber!.toString(),
                        style: TextStyle(
                          fontSize: stepCircleFontSize,
                          color: stepCircleLabelColor
                        )
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Text(currentStep.label!,
              style: const TextStyle(fontSize: 40, color: Colors.blueAccent)
            )
          ],
        );
      },
    );
  }
}