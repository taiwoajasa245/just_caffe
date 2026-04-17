import 'package:flutter/material.dart';

class SingletonData {
  static final SingletonData _instance = SingletonData.internal();

  factory SingletonData() => _instance;

  SingletonData._();

  static final SingletonData singletonData = SingletonData._();

  SingletonData.internal();

  //navigator key
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

}