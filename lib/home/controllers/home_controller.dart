import 'package:get/get.dart';
import 'package:scheduled_map/models/Items.dart';

class HomeController extends GetxController {
  List<Items> items = [
    new Items(title: "item1", image: "assets/icon/bus.png"),
    new Items(title: "item2", image: "assets/icon/bus.png"),
    new Items(title: "item3", image: "assets/icon/bus.png"),
  ].obs;

  List<Items> getItems() => items;

  void setItems(List<Items> items) {
    this.items = items;
  }

  void addItem(Items item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
