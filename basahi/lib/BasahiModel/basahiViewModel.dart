import 'package:basahi/BasahiAPI/basahiAPI.dart';
import 'basahiModel.dart';
import 'package:flutter/widgets.dart';

class BasahiViewModel with ChangeNotifier {
  List<Basahi> _data = [];
  List<Basahi> get data => _data;

  getAllData() async {
    var a = BasahiAPI();
    final q = await a.getALLData();
    _data = q;
    notifyListeners();
  }
}