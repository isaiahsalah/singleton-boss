import 'package:flutter/material.dart';

class DateTimeProvider with ChangeNotifier {
  int _filterState = 4;

  DateTime _dateTimeInit = DateTime.now();
  DateTime _dateTimeFin = DateTime.now();

  DateTime get dateTimeInit => _dateTimeInit;
  DateTime get dateTimeFin => _dateTimeFin;
  int get filterState => _filterState;

  Future<void> dateTimeInitChange(DateTime dateTimeInit) async {
    _dateTimeInit = dateTimeInit;
    _filterState = 4;
    notifyListeners();
  }

  Future<void> dateTimeFinChange(DateTime dateTimeFin) async {
    _dateTimeFin = dateTimeFin;
    _filterState = 4;
    notifyListeners();
  }

  Future<void> filterStateChange(int state) async {
    _filterState = state;
    notifyListeners();
  }
}