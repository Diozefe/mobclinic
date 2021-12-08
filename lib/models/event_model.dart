import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Home extends ChangeNotifier {
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

  String _textRigth = DateFormat.MMMM('pt_BR')
      .format(DateTime.utc(DateTime.now().year, DateTime.now().month + 1));
  String _leftMonth = 'Mês';
  String get leftMonth => _leftMonth;
  set leftMonth(String value) {
    _leftMonth = value;
    notifyListeners();
  }

  String _rigthMonth = '_textRigth';
  String get rigthMonth => _rigthMonth;
  set rigthMonth(String value) {
    _rigthMonth = value;
    notifyListeners();
  }
}

bool _checkEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
