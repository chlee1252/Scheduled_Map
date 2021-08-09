import 'package:flutter/material.dart';
import 'package:scheduled_map/details/controllers/details_state.dart';


class DetailsController extends ChangeNotifier {
  DetailState homeState = DetailState.NORMAL;

  void changeHomeState(DetailState state) {
    homeState = state;
    notifyListeners();
  }
}
