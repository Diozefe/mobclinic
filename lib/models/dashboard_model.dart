import 'package:flutter/cupertino.dart';

class DashboardModel extends ChangeNotifier {
  bool _isModify = true;
  isModify(bool value) {
    _isModify = value;
    print('Set chamado: $_isModify');

    notifyListeners();
  }

  getIsModified() {
    print('Get chamado: $_isModify');
    return _isModify;
  }
}
