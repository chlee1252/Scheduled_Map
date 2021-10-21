import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/add/client/dto/place_info.dart';
import 'package:scheduled_map/add/client/keyword_search_kakao.dart';
import 'package:scheduled_map/add/controllers/google_places_controller.dart';
import 'package:scheduled_map/add/controllers/selected_time_controller.dart';
import 'package:scheduled_map/add/controllers/text_field_controller.dart';
import 'package:scheduled_map/add/widget/add_text_form_field.dart';
import 'package:scheduled_map/add/widget/circular_button.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/models/Items.dart';

class AddScreen extends StatelessWidget {
  final SelectedTimeController selectedTimeController = Get.find();
  final HomeController homeController = Get.find();
  final TextFieldController textFieldController =
      Get.put(TextFieldController());
  final GooglePlacesController googlePlacesController =
      Get.put(GooglePlacesController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final KeywordSearchKakao kakaoSearch = new KeywordSearchKakao();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "일정 추가",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<GooglePlacesController>(
            builder: (value) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AddTextFormField(
                              controller:
                                  textFieldController.titleTextController,
                              label: "Title",
                              hintText: "일정 이름을 정해주세요",
                            ),
                            AddTextFormField(
                              controller:
                                  textFieldController.destinationTextController,
                              label: "출발지",
                              hintText: "출발지를 검색해 주세요",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                onPressed: () async {
                                  String value = textFieldController
                                      .destinationTextController.value.text;
                                  await _search(value);
                                },
                              ),
                            ),
                            AddTextFormField(
                              controller:
                                  textFieldController.departTextController,
                              label: "목적지",
                              hintText: "목적지를 검색해 주세요",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                onPressed: () async {
                                  String value = textFieldController
                                      .destinationTextController.value.text;
                                  await _search(value);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: defaultPadding,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: greyTheme,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (datetime) {
                            selectedTimeController.setTime(datetime);
                          },
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      CircularButton(
                        child: Text("Add"),
                        primaryColor: greyTheme,
                        onPrimaryColor: Colors.black,
                        onPressed: () {
                          homeController.addItem(
                            new Items(
                              title: textFieldController.getText,
                              image: "assets/icon/bus.png",
                              date: selectedTimeController.getTime(),
                            ),
                          );
                          textFieldController.clearInput();
                          Get.toNamed("/home");
                        },
                      ),
                      CircularButton(
                        child: Text("Cancel"),
                        primaryColor: Colors.black54,
                        onPrimaryColor: Colors.white,
                        onPressed: () {
                          textFieldController.clearInput();
                          Get.toNamed("/home");
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future _search(String value) async {
    if (value.isNotEmpty) {
      List<PlaceInfo> response = await kakaoSearch.getPlaceByKeyword(value);
      // TODO: 검색 결과창 or widget
      return response;
    } else {
      // TODO: Alert 보내기
      print("something");
    }
  }
}
