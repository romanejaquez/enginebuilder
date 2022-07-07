import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/step.model.dart';
import 'package:flutter/material.dart';

class StepService extends ChangeNotifier {

  List<StepItem> steps = Utils.getSteps();
  StepItem? currentStep;

  StepService() {
    currentStep = steps.first;
    currentStep!.isEnabled = true;
  }

  void enableNextStep() {
    if (currentStep != null && currentStep!.index! < steps.length - 1) {
      steps[currentStep!.index! + 1].isEnabled = true;
      notifyListeners();
    }
  }

  void setCurrentStep(StepItem step) {
    currentStep = step;
    notifyListeners();
  }

  bool isCurrentStep(StepItem item) {
    return currentStep != null && currentStep == item;
  }

  StepItem getCurrentStep() {
    return currentStep!;
  }

  void setStepCompleted(StepItem step) {
    step.isCompleted = true;
    notifyListeners();
  }

}