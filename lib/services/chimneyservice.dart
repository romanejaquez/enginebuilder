import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/chimneyitem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChimneyService extends ChangeNotifier {

  List<ChimneyItem> chimneys = Utils.getChimneys();
  ChimneyItem? selectedChimney;

  void setSelectedChimney(ChimneyItem item, BuildContext context) {
    selectedChimney = item;
    
    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }
}