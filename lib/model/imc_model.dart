// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class ImcModel {
  final String _id = UniqueKey().toString();
  double _peso;
  int _altura;

  ImcModel(
    this._peso,
    this._altura,
  );

  String get id => _id;

  double get peso => _peso;

  set setPeso(double peso) {
    _peso = peso;
  }

  int get altura => _altura;

  set setAltura(int altura) {
    _altura = altura;
  }

 
}
