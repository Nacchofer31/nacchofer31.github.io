import 'package:flutter/material.dart';
import 'package:igfersa_portfolio/base/interface_controller.dart';

class Provider extends InheritedWidget {
  const Provider({
    Key? key,
    required this.controllers,
    required super.child,
  }) : super(key: key);

  final List<InterfaceController> controllers;

  static T of<T extends InterfaceController<T>>(BuildContext context) {
    try {
      final root = context.dependOnInheritedWidgetOfExactType<Provider>()!;
      return root.controllers.firstWhere((element) => element is T) as T;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return false;
  }
}
