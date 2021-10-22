import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/add/client/dto/place_info.dart';
import 'package:scheduled_map/add/controllers/place_controller.dart';
import 'package:scheduled_map/add/controllers/text_field_controller.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/search/controller/location_info_controller.dart';
import 'package:scheduled_map/search/dto/location_info.dart';

class SearchScreen extends StatelessWidget {
  final PlaceController placeController = Get.find();
  final LocationInfoController locationInfoController = Get.find();
  final TextFieldController textFieldController = Get.find();
  @override
  Widget build(BuildContext context) {
    final String argument = Get.arguments;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
                onPressed: () => Get.back(),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: greyTheme,
              expandedHeight: 160.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  "결과",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ];
        },
        body: placeController.isEmpty()
            ? Center(
                child: Text("검색 결과가 없습니다."),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  PlaceInfo placeInfo =
                      placeController.searchResult.value[index];
                  return GestureDetector(
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                          ),
                        ],
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(placeInfo.placeName!),
                      ),
                      subtitle: Text(placeInfo.addressName!),
                    ),
                    onTap: () {
                      LocationInfo locationInfo = new LocationInfo(
                          x: placeInfo.x,
                          y: placeInfo.y,
                          placeName: placeInfo.placeName);
                      _setValuesByArguments(argument, locationInfo);
                      Get.back();
                    },
                  );
                },
                itemCount: placeController.searchResult.value.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
      ),
    );
  }

  void _setValuesByArguments(String argument, LocationInfo locationInfo) {
    if (argument == "출발") {
      locationInfoController.setDepart(locationInfo);
      textFieldController.departTextController.text = locationInfo.placeName!;
    } else {
      locationInfoController.setDestination(locationInfo);
      textFieldController.destinationTextController.text =
          locationInfo.placeName!;
    }
  }
}
