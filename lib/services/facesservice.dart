import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/enginefaceitem.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacesService extends ChangeNotifier {

  List<EngineFaceItem> faces = Utils.getEngineFaces();
  EngineFaceItem? selectedEngineFace;

  FacesService() {
    selectedEngineFace = EngineFaceItem(
      icon: EngineBuilderFonts.engineBuilderLogo,
      isSelected: false,
      imgName: 'none'
    );
  }

  void setSelectedEngineFace(EngineFaceItem item, BuildContext context) {
    selectedEngineFace = item;

    StepService stepService = Provider.of<StepService>(context, listen: false);
    stepService.enableNextStep();
    
    notifyListeners();
  }
}