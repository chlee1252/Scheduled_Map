import 'package:get/get.dart';
import 'package:scheduled_map/models/Items.dart';

class HomeController extends GetxController {
  // List<Items> items = [
  //   new Items(
  //       title: "item1", image: "assets/icon/bus.png", date: DateTime.now()),
  //   new Items(
  //       title: "item2", image: "assets/icon/bus.png", date: DateTime.now()),
  //   new Items(
  //       title: "item3", image: "assets/icon/bus.png", date: DateTime.now()),
  // ];

  List<Items> items = List.empty(growable: true);

  List<Items> getItems() => items;

  void setItems(List<Items> items) {
    this.items = items;
    update();
  }

  void addItem(Items item) {
    items.add(item);
    update();
  }

  void removeItem(int index) {
    items.removeAt(index);
    update();
  }

  void toggleSwitch(int index) {
    items[index].notification.toggle();
    update();
  }
}
