import 'package:flutter/material.dart';

class ViewController with ChangeNotifier {
  bool menuOpen = false;
  bool fulscreen = false;
  bool emoji = false;

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

  showEmoji() {
    emoji = true;
    notifyListeners();
  }

  hideEmoji() {
    emoji = false;
    notifyListeners();
  }
}
