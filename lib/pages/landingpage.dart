import 'package:build_engine_webapp/helpers/enginebuilderfonts.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/models/landingoption.dart';
import 'package:build_engine_webapp/widgets/enginebuilderheader.dart';
import 'package:flutter/material.dart';

class BuildEngineAppLanding extends StatelessWidget {
  const BuildEngineAppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<LandingOption> buttonItems = [
      LandingOption(
        icon: EngineBuilderFonts.engineBuilderLogo,
        label: 'CREATE ENGINE',
        route: '/create-engine',
        isSelected: false
      ),
      LandingOption(
        icon: Icons.check,
        label: 'LOAD EXISTING ENGINE',
        route: '/load-engine',
        isSelected: false
      )
    ];
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/bg_img.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          const EngineBuilderHeader(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('SELECT AN OPTION:',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainPurple)
                ),
                const SizedBox(height: 20),
                StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                  

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(buttonItems.length,
                    (index) {

                      var item = buttonItems[index];
                      return GestureDetector(
                        onTap: () {
                          Utils.mainApp.currentState!.pushNamed(item.route!);
                        },
                        child: MouseRegion(
                          onExit: (event) {
                            setState(() {
                              item.isSelected = false;
                            });
                          },
                          onEnter: (event) {
                            setState(() {
                              item.isSelected = true;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: item.isSelected! ? Utils.mainPurple : Colors.white,
                              border: Border.all(
                                color: Utils.mainPurple,
                                width: 5
                              ) 
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(item.icon,
                                  size: 80,
                                  color: item.isSelected! ? Colors.white : Utils.mainPurple
                                ),
                                const SizedBox(height: 10),
                                Text(item.label!,
                                  style: TextStyle(fontSize: 40, 
                                  color: item.isSelected! ? Colors.white : Utils.mainPurple)
                                )
                              ]
                            )
                          ),
                        ),
                        );
                      }
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      )
    );
  }
}