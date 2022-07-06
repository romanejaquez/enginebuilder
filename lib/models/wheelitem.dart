import 'package:build_engine_webapp/helpers/wheeltype.dart';
import 'package:flutter/material.dart';

class WheelItem {
  WheelType? type;
  bool? isSelected;
  String? label;
  String? imgValue;
  IconData? icon;

  WheelItem({
    this.type, this.isSelected, this.label, this.imgValue, this.icon
  });
}