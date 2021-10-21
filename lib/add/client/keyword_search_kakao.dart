import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

import 'dto/place_info.dart';

class KeywordSearchKakao {
  static final String apiKey = FlutterConfig.get("KAKAO_API_KEY");
  static final String baseUrl =
      "https://dapi.kakao.com/v2/local/search/keyword.json?query=";

  Future<List<PlaceInfo>> getPlaceByKeyword(String keyword) async {
    try {
      Map<String, String> headers = _createHeader();
      http.Response response = await sendRequest(keyword, headers);
      return createResult(response);
    } catch (ex) {
      debugPrint(ex.toString());
      return List.empty();
    }
  }

  Future<http.Response> sendRequest(
      String keyword, Map<String, String> headers) async {
    try {
      Uri uri = Uri.parse(baseUrl + keyword);
      return await http.get(uri, headers: headers);
    } catch (ex) {
      throw new Exception("Http Request Failed");
    }
  }

  List<PlaceInfo> createResult(http.Response response) {
    if (response.statusCode == 200) {
      return parseJsonToPlaceInfo(response);
    }
    return List.empty();
  }

  List<PlaceInfo> parseJsonToPlaceInfo(http.Response response) {
    List<PlaceInfo> result;
    dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
    result =
        (body['documents'] as List).map((e) => PlaceInfo.fromJson(e)).toList();
    return result;
  }

  Map<String, String> _createHeader() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "KakaoAK " + apiKey
    };
  }
}
