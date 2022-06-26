import 'package:flutter/material.dart';
import 'package:provider_weight_tracker/models/weight.dart';

class WeightState with ChangeNotifier {
  //Dummy datas
  List<Weight> _weights = [
    Weight(value: 65.0, time: DateTime.utc(2022, 6, 12)),
    Weight(value: 64.8, time: DateTime.utc(2022, 6, 15)),
    Weight(value: 63.7, time: DateTime.utc(2022, 6, 17)),
  ];
  List<Weight> get weights => _weights;

  add(Weight weight) {
    _weights.insert(0, weight);
    notifyListeners();
  }
}
