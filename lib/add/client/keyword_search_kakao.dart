//var client = http.Client();
// try {
//   var response = await client.post(
//       Uri.https('example.com', 'whatsit/create'),
//       body: {'name': 'doodle', 'color': 'blue'});
//   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//   var uri = Uri.parse(decodedResponse['uri'] as String);
//   print(await client.get(uri));
// } finally {
//   client.close();
// }

import 'package:flutter_config/flutter_config.dart';
import 'package:scheduled_map/add/client/dto/search_response.dart';

class KeywordSearchKakao {
  static final String apiKey = FlutterConfig.get("KAKAO_API_KEY");
  static final String baseUrl =
      "https://dapi.kakao.com/v2/local/search/keyword.json?query=";

  Future<SearchResponse> getPlaceByKeyword(String keyword) async {
    Map<String, String> headers = _createHeader();
    // var client = http.Client();
  }

  Map<String, String> _createHeader() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': apiKey
    };
  }
}
