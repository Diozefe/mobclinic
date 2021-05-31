import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    if (_checkEmail(input)) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }

  get isFocus => _isFocused;
  bool _isFocused = false;
  set isFocus(value) {
    _isFocused = value;
    notifyListeners();
  }
}

bool _checkEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
