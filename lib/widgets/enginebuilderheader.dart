import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:flutter/material.dart';

class EngineBuilderHeader extends StatelessWidget {
  const EngineBuilderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: const [
          Icon(EngineBuilderFonts.engineBuilderLogo, size: 50, color: Utils.mainPurple),
          SizedBox(width: 10),
          Text('BUILD YOUR ENGINE',
            style: TextStyle(color: Utils.mainPurple, fontSize: 30)
          )
        ],
      ),
    );
  }
}