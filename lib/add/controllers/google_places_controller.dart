import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';

class GooglePlacesController extends GetxController {
  static final String apiKey = FlutterConfig.get("GOOGLE_API_KEY");
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: apiKey);

  Future<Prediction?> getPrediction(BuildContext context) async {
    // TODO: 다른 플러그인 찾아보기 -> 불안정함
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: apiKey,
      mode: Mode.fullscreen,
      strictbounds: false,
      offset: 0,
      radius: 100000000,
      language: "en",
      decoration: InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      onError: (value) {
        print(value.errorMessage!);
      },
      types: [],
      components: [new Component(Component.country, "ko")],
    );
    print(p);
    print("Prediction");
    return p;
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await places.getDetailsByPlaceId(p.placeId!);
      update();
    }
  }
}
