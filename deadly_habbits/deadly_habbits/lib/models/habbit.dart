import 'package:flutter/material.dart';

class Habit {
  const Habit(
      {required this.title,
      this.icon = Icons.warning,
      this.count = 0,
      this.unitPrice = 0,
      required this.countTitle,
      required this.unitTitle});
  final String title;
  final IconData icon;
  final double unitPrice;
  final String unitTitle;

  final String countTitle;
  final int count;

  double get dayEconomy => unitPrice * count;
  double get weekEconomy => (unitPrice * count) * 7;
  double get monthEconomy => (unitPrice * count) * 30;
  double get yearEconomy => (unitPrice * count) * 365;

}
