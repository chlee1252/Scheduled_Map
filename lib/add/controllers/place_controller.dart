import 'package:get/get.dart';
import 'package:scheduled_map/add/client/dto/place_info.dart';
import 'package:scheduled_map/add/client/keyword_search_kakao.dart';

class PlaceController extends GetxController {
  KeywordSearchKakao kakao = new KeywordSearchKakao();
  RxList searchResult = <PlaceInfo>[].obs;

  Future<void> loadPlacesByKeyword(String keyword) async {
    // List<PlaceInfo> search = await kakao.getPlaceByKeyword(keyword);
    searchResult.value = await kakao.getPlaceByKeyword(keyword);
    update();
    // return search;
  }

  bool isEmpty() {
    return searchResult.value.isEmpty;
  }
}
