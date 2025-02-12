import 'package:flutter/material.dart';

class GlobalModel with ChangeNotifier {
  int _index_stack = 0;
  int _previousIndex = 0;

  int get indexStack => _index_stack;
  int get previousIndex => _previousIndex;

  void setIndexStack(index) {
    _index_stack = index;
    notifyListeners();
  }

  void setPreviousIndex(index) {
    _previousIndex = index;
    notifyListeners();
  }
}
