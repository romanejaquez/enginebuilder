import 'package:build_engine_webapp/services/namenumberservice.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameNumberDisplay extends StatelessWidget {
  const NameNumberDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NameNumberService>(
      builder: (context, nnService, child) {

        if (nnService.selectedNameNumberItem != null) {

          String fontFamilyName = nnService.selectedNameNumberItem != null ? nnService.selectedNameNumberItem!.fontName! : '';
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 380,
                left: 220,
                child: Text(nnService.engineNumber.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: fontFamilyName, fontSize: 40, color: Colors.white)
                ),
              ),
              Positioned(
                top: 380,
                left: 420,
                child: Text(nnService.engineName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: fontFamilyName, fontSize: 40, color: Colors.white)
                ),
              )
            ],
          );
        }

        return const SizedBox();
      }
    );
  }
}