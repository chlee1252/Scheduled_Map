import 'package:scheduled_map/add/client/dto/place_info.dart';

class SearchResponse {
  late List<PlaceInfo> _places;

  List<PlaceInfo> get places => _places;

  set places(List<PlaceInfo> value) {
    _places = value;
  }
}
