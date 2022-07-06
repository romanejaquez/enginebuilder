import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/coloritem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorService extends ChangeNotifier {

  List<ColorItem> engineColors = Utils.getColorItems();
  ColorItem? selectedEngineColor;

  void setSelectedColor(ColorItem item, BuildContext context) {
    selectedEngineColor = item;

    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }

  ColorItem? getSelectedEngineColor() {
    return selectedEngineColor ?? null;
  }
}