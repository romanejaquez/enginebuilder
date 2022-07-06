import 'package:build_engine_webapp/helpers/whistletype.dart';
import 'package:flutter/material.dart';

class WhistleItem {
  WhistleType? type;
  bool? isSelected;
  String? label;
  String? imgValue;
  IconData? icon;

  WhistleItem({
    this.type, this.isSelected, this.label, this.imgValue, this.icon
  });
}