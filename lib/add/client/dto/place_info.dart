class PlaceInfo {
  String? addressName;
  String? categoryGroupCode;
  String? categoryGroupName;
  String? categoryName;
  String? distance;
  String? id;
  String? phone;
  String? placeName;
  String? placeUrl;
  String? roadAddressName;
  String? x;
  String? y;

  PlaceInfo(
      {this.addressName,
      this.categoryGroupCode,
      this.categoryGroupName,
      this.categoryName,
      this.distance,
      this.id,
      this.phone,
      this.placeName,
      this.placeUrl,
      this.roadAddressName,
      this.x,
      this.y});

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
        addressName: json['address_name'] as String,
        categoryGroupCode: json['category_group_code'] as String,
        categoryGroupName: json['category_group_name'] as String,
        categoryName: json['category_name'] as String,
        distance: json['distance'] as String,
        id: json['id'] as String,
        phone: json['phone'] as String,
        placeName: json['place_name'] as String,
        placeUrl: json['place_url'] as String,
        roadAddressName: json['road_address_name'] as String,
        x: json['x'] as String,
        y: json['y'] as String);
  }
}
