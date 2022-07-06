import 'package:flutter/material.dart';

class LandingOption {
  String? label;
  IconData? icon;
  String? route;
  bool? isSelected;

  LandingOption({
    this.label, this.icon, this.route, this.isSelected
  });
}