import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduled_map/add/controllers/selected_time_controller.dart';
import 'package:scheduled_map/add/widget/circular_button.dart';
import 'package:scheduled_map/constants.dart';

class AddScreen extends StatelessWidget {
  final SelectedTimeController selectedTimeController =
      Get.put(SelectedTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
                  child: Placeholder(
                    fallbackHeight: 100.0,
                  ),
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
                  onDateTimeChanged: (datetime) =>
                      SelectedTimeController().setTime(datetime),
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              CircularButton(
                child: Text("Add"),
                primaryColor: greyTheme,
                onPrimaryColor: Colors.black,
                onPressed: () => Get.toNamed("/home"),
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
    );
  }
}
