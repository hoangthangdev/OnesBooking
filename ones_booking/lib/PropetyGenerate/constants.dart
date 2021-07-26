import 'package:flutter/material.dart';

final inputDecoration = InputDecoration(
  contentPadding:const EdgeInsets.symmetric(vertical: 15),
  enabledBorder: outlineInputBoder(),
  focusedBorder: outlineInputBoder(),
);

OutlineInputBorder outlineInputBoder(){
return OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide:const BorderSide(color: Colors.black87)
);
}