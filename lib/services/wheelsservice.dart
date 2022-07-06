import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/wheelitem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WheelsService extends ChangeNotifier {

  List<WheelItem> wheels = Utils.getWheelItems();
  WheelItem? selectedWheelItem;

  void setSelectedWheelItem(WheelItem item, BuildContext context) {
    selectedWheelItem = item;

    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }
}