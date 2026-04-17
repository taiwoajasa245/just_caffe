import 'package:just_caffe/src/core/navigation/singleton_data.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future<dynamic> pushToNextScreen({
    BuildContext? context,
    required Widget child,
    required String name,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
    Object? arguments,
  }) {
    context = context ?? SingletonData().navigationKey.currentState!.context;
    return Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => child,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: name, arguments: arguments),
      ),
    );
  }

  static Future<dynamic> pushReplacementToNextScreen({
    BuildContext? context,
    required Widget child,
    required String name,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
    Object? arguments,
  }) {
    context = context ?? SingletonData().navigationKey.currentState!.context;
    return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      MaterialPageRoute(
        builder: (context) => child,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: name, arguments: arguments),
      ),
    );
  }

  static popUntil({
    BuildContext? context,
    required String name,
    bool rootNavigator = false,
  }) {
    context = context ?? SingletonData().navigationKey.currentState!.context;
    Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).popUntil(ModalRoute.withName(name));
  }

  static pop({
    BuildContext? context,
    bool rootNavigator = false,
    resultToSendBack,
  }) {
    context = context ?? SingletonData().navigationKey.currentState!.context;
    Navigator.of(context, rootNavigator: rootNavigator).pop(resultToSendBack);
  }
}
