import 'package:build_engine_webapp/helpers/actiontype.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:build_engine_webapp/widgets/chimneywidget.dart';
import 'package:build_engine_webapp/widgets/colorwidget.dart';
import 'package:build_engine_webapp/widgets/faceswidget.dart';
import 'package:build_engine_webapp/widgets/namenumberwidget.dart';
import 'package:build_engine_webapp/widgets/wheelswidget.dart';
import 'package:build_engine_webapp/widgets/whistleswidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepActionSelection extends StatelessWidget {
  const StepActionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StepService>(
      builder: (context, service, child) {

        Widget? stepAction;

        switch(service.currentStep!.action) {
          case StepActionType.color:
            stepAction = const ColorWidget();
            break;
          case StepActionType.wheel:
            stepAction = const WheelsWidget();
            break;
          case StepActionType.whistle:
            stepAction = const WhistlesWidget();
            break;
          case StepActionType.chimney:
            stepAction = const ChimneyWidget();
            break;
          case StepActionType.nameNumber:
            stepAction = const NameNumberWidget();
            break;
          case StepActionType.face:
            stepAction = const FacesWidget();
            break;
          default:
            stepAction = const ColorWidget();
            break;
        }

        return stepAction;
      },
    );
  }
}