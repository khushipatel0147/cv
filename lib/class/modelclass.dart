import 'package:flutter/material.dart';

class DataModel
{
  String? name,add,email,cont,edu,lan,exp,path,surname;
  RangeValues? rangeValues;

  DataModel(
      {this.name,
      this.surname,
      this.add,
      this.email,
      this.cont,
      this.edu,
      this.lan,
      this.exp,
      this.rangeValues,
      this.path});
}
