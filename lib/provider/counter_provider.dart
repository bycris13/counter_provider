import 'package:flutter/material.dart';

/// Esta clase maneja el estado del contador.
/// Llama a `notifyListeners()` cada vez que cambia el valor,
/// lo cual notifica a los widgets que estén usando `watch` para que se reconstruyan.
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count <= 0) return;

    _count--;

    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
