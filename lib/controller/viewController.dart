import 'package:flutter/material.dart';

class ViewController with ChangeNotifier {
  bool menuOpen = false;
  bool fulscreen = false;

  showmenu() {
    menuOpen = true;
    notifyListeners();
  }

  hidemenu() {
    menuOpen = false;
    notifyListeners();
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
