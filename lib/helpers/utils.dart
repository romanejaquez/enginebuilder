import 'package:build_engine_webapp/helpers/actiontype.dart';
import 'package:build_engine_webapp/helpers/chimneytype.dart';
import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/enginecolors.dart';
import 'package:build_engine_webapp/helpers/sideactiontype.dart';
import 'package:build_engine_webapp/helpers/wheeltype.dart';
import 'package:build_engine_webapp/helpers/whistletype.dart';
import 'package:build_engine_webapp/models/chimneyitem.dart';
import 'package:build_engine_webapp/models/coloritem.dart';
import 'package:build_engine_webapp/models/enginefaceitem.dart';
import 'package:build_engine_webapp/models/namenumberitem.dart';
import 'package:build_engine_webapp/models/sideoption.dart';
import 'package:build_engine_webapp/models/step.model.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/models/whistleitem.dart';
import 'package:flutter/material.dart';

class Utils {

  static GlobalKey<NavigatorState> mainApp = GlobalKey<NavigatorState>();
  static GlobalKey? imgGlobalKey;
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

  static List<SideOption> getSideOptions() {
    return [
      SideOption(
        label: 'SAVE',
        type: SideActionType.save,
        icon: Icons.favorite
      ),
      SideOption(
        label: 'DOWNLOAD',
        type: SideActionType.download,
        icon: Icons.cloud_download
      ),
      SideOption(
        label: 'DELETE',
        type: SideActionType.delete,
        icon: Icons.delete
      )
    ];
  }

  static List<EngineFaceItem> getEngineFaces() {
    return [
      EngineFaceItem(
        icon: EngineBuilderFonts.face1,
        isSelected: false,
        imgName: 'earnest'
      ),
      EngineFaceItem(
        icon: EngineBuilderFonts.face2,
        isSelected: false,
        imgName: 'plucky'
      ),
      EngineFaceItem(
        icon: EngineBuilderFonts.face3,
        isSelected: false,
        imgName: 'sassy'
      ),
      EngineFaceItem(
        icon: EngineBuilderFonts.face5,
        isSelected: false,
        imgName: 'smarty_glasses'
      ),
      EngineFaceItem(
        icon: EngineBuilderFonts.face6,
        isSelected: false,
        imgName: 'smiley'
      ),
      EngineFaceItem(
        icon: EngineBuilderFonts.face7,
        isSelected: false,
        imgName: 'spunky'
      )
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

  static List<NameNumberItem> getNameNumberItems() {
    return [
      NameNumberItem(
        isSelected: false,
        label: 'AA',
        fontName: 'cowboyjunk'
      ),
      NameNumberItem(
        isSelected: false,
        label: 'AA',
        fontName: 'Product Sans Regular'
      ),
      NameNumberItem(
        isSelected: false,
        label: 'AA',
        fontName: 'DK Lemon Yellow Sun'
      ),
    ];
  }

  static List<WhistleItem> getWhistleItems() {
    return [
      WhistleItem(
        type: WhistleType.air,
        isSelected: false,
        label: 'Air',
        imgValue: 'air',
        icon: EngineBuilderFonts.whistle1
      ),
      WhistleItem(
        type: WhistleType.steam,
        isSelected: false,
        label: 'Steam',
        imgValue: 'steam',
        icon: EngineBuilderFonts.whistle2
      ),
      WhistleItem(
        type: WhistleType.tugboat,
        isSelected: false,
        label: 'Tugboat',
        imgValue: 'tugboat',
        icon: EngineBuilderFonts.whistle3
      )
    ];
  }

  static List<ChimneyItem> getChimneys() {
    return [
      ChimneyItem(
        type: ChimneyType.crowned,
        isSelected: false,
        label: 'Crowned',
        imgValue: 'crowned',
        icon: EngineBuilderFonts.chimney1
      ),
      ChimneyItem(
        type: ChimneyType.oldStyle,
        isSelected: false,
        label: 'Old Style',
        imgValue: 'old_style',
        icon: EngineBuilderFonts.chimney2
      ),
      ChimneyItem(
        type: ChimneyType.shortCrowned,
        isSelected: false,
        label: 'Short Crowned',
        imgValue: 'short_crowned',
        icon: EngineBuilderFonts.chimney3
      ),
      ChimneyItem(
        type: ChimneyType.short,
        isSelected: false,
        label: 'Short',
        imgValue: 'short',
        icon: EngineBuilderFonts.chimney4
      ),
      ChimneyItem(
        type: ChimneyType.wide,
        isSelected: false,
        label: 'Wide',
        imgValue: 'wide',
        icon: EngineBuilderFonts.chimney5
      )
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