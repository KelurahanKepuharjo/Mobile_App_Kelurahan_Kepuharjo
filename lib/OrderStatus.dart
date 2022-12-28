import 'package:flutter/material.dart';

class OrderStatus with ChangeNotifier {
  bool _isOrderInProgress = false;
  String _currentApplicationType;

  bool get isOrderInProgress => _isOrderInProgress;
  String get currentApplicationType => _currentApplicationType;

  void setInProgress(bool inProgress, [String applicationType]) {
    _isOrderInProgress = inProgress;
    _currentApplicationType = applicationType;
    notifyListeners();
  }
}
