import 'package:flutter/material.dart';

const kTextInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
  ),
  filled: true,
  fillColor: Color(0xFFBCAAA4),
);

//API URL
class Strings{
  static String news_url ='https://api.first.org/data/v1/news ';

}
