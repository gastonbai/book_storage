import 'package:flutter/material.dart';

///Создание симметрии виджета
extension PuddingWidget on Widget{
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingOnly({
    double ? top,
    double ? bottom,
    double ? left,
    double ? right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        left: left ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  Widget paddingSymmetric({
    double horisontal = 0,
    double vertical = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horisontal,
        vertical: vertical,
      ),
      child: this,
    );
  }
}
