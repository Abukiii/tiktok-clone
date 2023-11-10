import 'package:flutter/material.dart';

class ViewController with ChangeNotifier {
  bool menuOpen = false;
  bool fulscreen = false;

  showmenu() {
    menuOpen = true;
    notifyListeners();
    print(menuOpen);
  }

  hidemenu() {
    menuOpen = false;
    notifyListeners();
    print(menuOpen);
  }

  makefullscreen() {
    fulscreen = true;
    notifyListeners();
  }

  clearfullscreen() {
    fulscreen = false;
    notifyListeners();
  }
}
