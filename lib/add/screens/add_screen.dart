import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final SelectedTimeController selectedTimeController =
      Get.put(SelectedTimeController());
  final TextFieldController textFieldController =
      Get.put(TextFieldController());
  final PlaceController placeController = Get.put(PlaceController());
  final LocationInfoController locationInfoController =
      Get.put(LocationInfoController());
  final HomeController homeController = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                      if (!checkInputValidation(context)) {
                        return;
                      }
                      homeController.addItem(
                        new Items(
                          title: textFieldController.getText,
                          image: "assets/icon/bus.png",
                          date: selectedTimeController.getTime(),
                          depart: locationInfoController.depart,
                          destination: locationInfoController.destination,
                        ),
                      );
                      Get.back();
                    },
                  ),
                  CircularButton(
                    child: Text("Cancel"),
                    primaryColor: Colors.black54,
                    onPrimaryColor: Colors.white,
                    onPressed: () {
                      Get.back();
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

  bool checkInputValidation(BuildContext context) {
    if (locationInfoController.depart.x == null ||
        locationInfoController.depart.y == null) {
      alertErrorDiaglog(context, "지은아 출발지 검색 먼저 해줘 ㅎㅎ..");
      return false;
    } else if (locationInfoController.destination.x == null ||
        locationInfoController.destination.y == null) {
      alertErrorDiaglog(context, "지은아 도착지 검색 먼저 해줘 ㅎㅎ..");
      return false;
    }
    return true;
  }

  Future<void> _search(
      String value, BuildContext context, String arguments) async {
    if (value.isNotEmpty) {
      await placeController.loadPlacesByKeyword(value);
      Get.toNamed("/search", arguments: arguments);
    } else {
      alertErrorDiaglog(context, "키워드를 입력해 주세요.");
    }
  }

  void alertErrorDiaglog(BuildContext context, String content) {
    if (Platform.isIOS) {
      DialogUtil.showCupertinoAlertDialog(context, content);
      return;
    }
    DialogUtil.showAlertDialog(context, content);
  }
}
