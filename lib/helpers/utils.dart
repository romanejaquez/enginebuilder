import 'package:build_engine_webapp/helpers/actiontype.dart';
import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/enginecolors.dart';
import 'package:build_engine_webapp/helpers/wheeltype.dart';
import 'package:build_engine_webapp/models/coloritem.dart';
import 'package:build_engine_webapp/models/step.model.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:flutter/material.dart';

class Utils {

  static GlobalKey<NavigatorState> mainApp = GlobalKey<NavigatorState>();
  static const Color mainPurple = Color(0xFF9400A7);
  static const Color secondaryPurple = Color(0xFF4A0054);

  static List<StepItem> getSteps() {
    return [
      StepItem(
        index: 0,
        stepNumber: 1,
        label: "Select The Color",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.color,
        isEnabled: false
      ),
      StepItem(
        index: 1,
        stepNumber: 2,
        label: "Select The Type of Wheel",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.wheel,
        isEnabled: false
      ),
      StepItem(
        index: 2,
        stepNumber: 3,
        label: "Select The Type of Whistle",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.whistle,
        isEnabled: false
      ),
      StepItem(
        index: 3,
        stepNumber: 4,
        label: "Select The Type of Chimney",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.chimney,
        isEnabled: false
      ),
      StepItem(
        index: 4,
        stepNumber: 5,
        label: "Add Name and Number",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.nameNumber,
        isEnabled: false
      ),
      StepItem(
        index: 5,
        stepNumber: 6,
        label: "Select the Face",
        isCompleted: false,
        isSelected: false,
        action: StepActionType.face,
        isEnabled: false
      ),
    ];
  }

  static List<WheelItem> getWheelItems() {
    return [
      WheelItem(
        type: WheelType.circular,
        isSelected: false,
        label: "Circular",
        imgValue: "circular",
        icon: EngineBuilderFonts.wheel1
      ),
      WheelItem(
        type: WheelType.eightSpoke,
        isSelected: false,
        label: "8-Spoke",
        imgValue: "eightspoke",
        icon: EngineBuilderFonts.wheel2
      ),
      WheelItem(
        type: WheelType.multiSpoke,
        isSelected: false,
        label: "Multi-Spoke",
        imgValue: "multispoke",
        icon: EngineBuilderFonts.wheel3
      ),
    ];
  }

  static List<ColorItem> getColorItems() {
    return [
      ColorItem(
        engineColor: EngineColors.red,
        isSelected: false
      ),
      ColorItem(
        engineColor: EngineColors.blue,
        isSelected: false
      ),
      ColorItem(
        engineColor: EngineColors.green,
        isSelected: false
      ),
      ColorItem(
        engineColor: EngineColors.wood,
        isSelected: false
      ),
      ColorItem(
        engineColor: EngineColors.purple,
        isSelected: false
      )
    ];
  }

  static Color getColorFromEngineColor(EngineColors color) {

    switch(color) {
      case EngineColors.red:
        return const Color(0xFFFF0000);
      case EngineColors.blue:
        return const Color(0xFF008BD5);
      case EngineColors.green:
        return const Color(0xFF06AA00);
      case EngineColors.wood:
        return const Color(0xFF832300);
      case EngineColors.purple:
        return const Color(0xFF5600E0);
    }
  }

  static String getEngineColorAsString(EngineColors color) {

    switch(color) {
      case EngineColors.red:
        return 'red';
      case EngineColors.green:
        return 'green';
      case EngineColors.blue:
        return 'blue';
      case EngineColors.wood:
        return 'wood';
      case EngineColors.purple:
        return 'purple';
      default:
        return 'none';
    }
  }
}