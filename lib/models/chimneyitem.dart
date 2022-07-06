import 'package:build_engine_webapp/helpers/chimneytype.dart';
import 'package:flutter/material.dart';

class ChimneyItem {
  ChimneyType? type;
  bool? isSelected;
  String? label;
  String? imgValue;
  IconData? icon;

  ChimneyItem({
    this.type, this.isSelected, this.label, this.imgValue, this.icon
  });
}