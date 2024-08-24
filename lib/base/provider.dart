import 'package:flutter/material.dart';
import 'package:nacchofer31_portfolio/portfolio.dart';

class Provider extends InheritedWidget {
  const Provider({
    super.key,
    required this.controllers,
    required super.child,
  });

  final List<Controller> controllers;

  static T of<T extends Controller<T>>(BuildContext context) {
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
