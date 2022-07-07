import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/namenumberitem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameNumberService extends ChangeNotifier {

  List<NameNumberItem> nameNumberItems = Utils.getNameNumberItems();
  NameNumberItem? selectedNameNumberItem;
  int engineNumber = 0;
  String engineName = '';

  void setSelectedNameNumberItem(NameNumberItem item, BuildContext context) {
    selectedNameNumberItem = item;

    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }

  void setEngineNumber(int number) {
    engineNumber = number;
    notifyListeners();
  }

  void setEngineName(String name) {
    engineName = name;
    notifyListeners();
  }
}