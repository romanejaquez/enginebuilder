import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/whistleitem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhistleService extends ChangeNotifier {
  
  List<WhistleItem> whistles = Utils.getWhistleItems();
  WhistleItem? selectedWhistle;

  void setSelectedWhistle(WhistleItem item, BuildContext context) {
    selectedWhistle = item;
    
    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }
}