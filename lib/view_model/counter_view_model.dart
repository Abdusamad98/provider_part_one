import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    print("Aslida :$counter");
    notifyListeners();
  }
}
