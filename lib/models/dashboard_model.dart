import 'package:flutter/cupertino.dart';

class Dashboard extends ChangeNotifier {
  bool _isModify = true;
  set isModify(bool value) {
    _isModify = value;

    notifyListeners();
  }

  bool get isModify {
    return _isModify;
  }
}
