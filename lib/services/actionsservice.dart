import 'package:build_engine_webapp/helpers/sideactiontype.dart';
import 'package:build_engine_webapp/helpers/utils.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;

class ActionsService {

  void performAction(SideActionType type) {

    switch(type) {
      case SideActionType.save:
        saveEngine();
        break;
      case SideActionType.delete:
        deleteEngine();
        break;
      case SideActionType.download:
        exportEngineAsImage();
        break;
    }
  }

  void exportEngineAsImage() async {
    
    try {
      RenderRepaintBoundary boundary = Utils.imgGlobalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      final base64 = base64Encode(pngBytes);
      final anchor =
          html.AnchorElement(href: 'data:application/octet-stream;base64,$base64')
            ..download = "build-engine.png"
            ..target = 'blank';
    
      html.document.body!.append(anchor);
      anchor.click();
      anchor.remove();
    } catch (e) {
      //
    }
  }

  void saveEngine() {}

  void deleteEngine() {}
}