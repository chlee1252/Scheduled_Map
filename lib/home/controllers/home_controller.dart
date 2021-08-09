import 'package:flutter/material.dart';
import 'package:scheduled_map/home/controllers/home_state.dart';


class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.NORMAL;

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }
}
