import 'dart:convert';
import 'package:intl/intl.dart';

AllVehicles allVehiclesFromJson(String str) => AllVehicles.fromJson(json.decode(str));

class AllVehicles {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Vehicle>? vehicles;

  AllVehicles({
    this.count,
    this.next,
    this.previous,
    this.vehicles,
  });

  factory AllVehicles.fromJson(Map<String, dynamic> json) => AllVehicles(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    vehicles:  List<Vehicle>.from(json["results"].map((x) => Vehicle.fromJson(x))),
  );

}

class Vehicle {
  Vehicle({
    this.id, this.ownerId, this.owner,
    this.manufacturer, this.model,
    this.modelYear, this.price,
    this.postingDate, this.distanceTraveled,
    this.description, this.images,
  });
  int? id;
  int? ownerId;
  String? owner;
  String? manufacturer;
  String? model;
  int? modelYear;
  double? price;
  String? postingDate;
  double? distanceTraveled;
  String? description;
  List<dynamic>? images;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    ownerId: json["owner_id"],
    owner: json["owner"],
    manufacturer: json["manufacturer"],
    model: json["model"],
    modelYear: json["model_year"],
    price: json["price"],
    postingDate:((DateTime.now().difference(DateTime.parse(json["posting_date"])).inHours)<1)?
                  (DateTime.now().difference(DateTime.parse(json["posting_date"])).inMinutes).toString()+" min ago":
                  ((DateTime.now().difference(DateTime.parse(json["posting_date"])).inHours)<24)?
                  (DateTime.now().difference(DateTime.parse(json["posting_date"])).inHours).toString()+" h ago":
                  DateFormat.yMMMd().format( DateTime.parse(json["posting_date"])),
    distanceTraveled: json["distance_traveled"],
    description: json["description"],
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "owner": owner,
    "manufacturer": manufacturer,
    "model": model,
    "model_year": modelYear,
    "price": price,
    "posting_date": postingDate.toString(),
    "distance_traveled": distanceTraveled,
    "description": description,
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image ,
  };
}
