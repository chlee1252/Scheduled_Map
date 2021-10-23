import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/add/controllers/google_places_controller.dart';
import 'package:scheduled_map/add/controllers/place_controller.dart';
import 'package:scheduled_map/add/controllers/selected_time_controller.dart';
import 'package:scheduled_map/add/controllers/text_field_controller.dart';
import 'package:scheduled_map/add/widget/add_text_form_field.dart';
import 'package:scheduled_map/add/widget/circular_button.dart';
import 'package:scheduled_map/constants.dart';
import 'package:scheduled_map/home/controllers/home_controller.dart';
import 'package:scheduled_map/models/Items.dart';
import 'package:scheduled_map/search/controller/location_info_controller.dart';
import 'package:scheduled_map/util/dialog_util.dart';

class AddScreen extends StatelessWidget {
  final SelectedTimeController selectedTimeController = Get.find();
  final HomeController homeController = Get.find();
  final TextFieldController textFieldController =
      Get.put(TextFieldController());
  final GooglePlacesController googlePlacesController =
      Get.put(GooglePlacesController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PlaceController placeController = Get.put(PlaceController());
  final LocationInfoController locationInfoController =
      Get.put(LocationInfoController());

  @override
  Widget build(BuildContext context) {
    // TODO: Screen Build 할때 reset 하고 있는데, 더 좋은 방법 찾아보기..ㅠ
    selectedTimeController.resetTimeToNow();

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
          child: Form(
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
                          controller: textFieldController.titleTextController,
                          label: "Title",
                          hintText: "일정 이름을 정해주세요",
                        ),
                        AddTextFormField(
                          controller: textFieldController.departTextController,
                          label: "출발지",
                          hintText: "출발지를 검색해 주세요",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            onPressed: () async {
                              String value = textFieldController
                                  .departTextController.value.text;
                              await _search(value, context, "출발");
                            },
                          ),
                        ),
                        AddTextFormField(
                          controller:
                              textFieldController.destinationTextController,
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
                              await _search(value, context, "도착");
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
                          depart: locationInfoController.depart,
                          destination: locationInfoController.destination,
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
          ),
        ),
      ),
    );
  }

  Future<void> _search(
      String value, BuildContext context, String arguments) async {
    if (value.isNotEmpty) {
      await placeController.loadPlacesByKeyword(value);
      Get.toNamed("/search", arguments: arguments);
    } else {
      alertEmptyInput(context);
    }
  }

  void alertEmptyInput(BuildContext context) {
    if (Platform.isIOS) {
      DialogUtil.showCupertinoAlertDialog(context);
      return;
    }
    DialogUtil.showAlertDialog(context);
  }
}
