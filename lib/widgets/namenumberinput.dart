import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:build_engine_webapp/services/namenumberservice.dart';
import 'package:build_engine_webapp/services/stepservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameNumberInput extends StatefulWidget {
  const NameNumberInput({Key? key}) : super(key: key);

  @override
  State<NameNumberInput> createState() => _NameNumberInputState();
}

class _NameNumberInputState extends State<NameNumberInput> {

  late TextEditingController numberInput;
  late TextEditingController nameInput;

  @override 
  void initState() {
    super.initState();

    numberInput = TextEditingController();
    nameInput = TextEditingController();
  }

  @override
  void dispose() {
    numberInput.dispose();
    nameInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    NameNumberService nnService = Provider.of<NameNumberService>(context, listen: false);

    return Consumer<StepService>(
      builder: (context, stepService, child) {

        if (stepService.currentStep!.index == 4) {
          
          return Consumer<NameNumberService>(
            builder: (context, nnService, child) {
              
              if (nnService.selectedNameNumberItem != null) {

                return Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 5,
                      color: Utils.mainPurple
                    )
                  ),
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (String value) {
                              nnService.setEngineNumber(int.parse(value));
                            },
                            controller: numberInput,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            style: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 20),
                            decoration: InputDecoration(
                              label: Text("Number", style: TextStyle(fontSize: 15)),
                              hintStyle: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 15),
                              helperStyle: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 15)
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            onChanged: (String value) {
                              nnService.setEngineName(value);
                            },
                            controller: nameInput,
                            maxLength: 10,
                            style: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 20),
                            decoration: InputDecoration(
                              label: Text("Name", style: TextStyle(fontSize: 15)),
                              hintStyle: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 15),
                              helperStyle: TextStyle(fontFamily: 'Product Sans Regular', fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                );
              }

              return const SizedBox();
            }
          );
        }

        return const SizedBox();
      }
    );
  }
}