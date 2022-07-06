import 'package:build_engine_webapp/helpers/actiontype.dart';

class StepItem {

  int? index;
  int? stepNumber;
  String? label;
  bool? isSelected;
  bool? isCompleted;
  bool? isEnabled;
  StepActionType? action;

  StepItem({ 
    this.index, 
    this.stepNumber, 
    this.label, 
    this.isSelected, 
    this.isCompleted,
    this.isEnabled,
    this.action
  });
}