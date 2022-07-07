import 'package:build_engine_webapp/helpers/sideactiontype.dart';
import 'package:flutter/material.dart';

class SideOption {

  SideActionType? type;
  String? label;
  IconData? icon;

  SideOption({
    this.type, this.label, this.icon
  });
}