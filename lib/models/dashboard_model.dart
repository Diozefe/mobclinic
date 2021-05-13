import 'package:flutter/cupertino.dart';

class DashboardModel extends ChangeNotifier {
  bool _isModify = true;
  isModify(bool value) {
    _isModify = value;
    notifyListeners();
  }

  getIsModified() {
    return _isModify;
  }
}
