import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
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
  final TextFieldController textFieldController = Get.find();

  @override
  Widget build(BuildContext context) {
    Future<Prediction?> getPrediction() async {
      // TODO: 다른 플러그인 찾아보기 -> 불안정함
      Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: FlutterConfig.get("GOOGLE_API_KEY"),
        mode: Mode.overlay,
        strictbounds: false,
        offset: 0,
        radius: 1000,
        language: "ko",
        decoration: InputDecoration(
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        types: [],
        components: [new Component(Component.country, "ko")],
      );
      return p;
    }

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
                        label: "Title",
                        hintText: "일정 이름을 정해주세요",
                      ),
                      AddTextFormField(
                        label: "출발지",
                        hintText: "출발지를 검색해 주세요",
                        onTap: () async {
                          var value = await getPrediction();
                        },
                      ),
                      AddTextFormField(
                        label: "목적지",
                        hintText: "목적지를 검색해 주세요",
                        onTap: () async {
                          var value = await getPrediction();
                        },
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
                    Get.toNamed("/home");
                  },
                ),
                CircularButton(
                  child: Text("Cancel"),
                  primaryColor: Colors.black54,
                  onPrimaryColor: Colors.white,
                  onPressed: () => Get.toNamed("/home"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
