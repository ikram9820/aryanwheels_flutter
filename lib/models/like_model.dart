import 'vehicles_model.dart';
import 'dart:convert';

Like likeFromJson(String str) => Like.fromJson(json.decode(str));

class Like {
  Like({
    this.id,
    this.userId,
    this.likedAt,
    this.likedPosts,
  });

  String? id;
  dynamic userId;
  DateTime? likedAt;
  List<LikedItem>? likedPosts;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["id"],
    userId: json["user_id"],
    likedAt: DateTime.parse(json["liked_at"]),
    likedPosts: List<LikedItem>.from(json["liked_item"].map((x) => LikedItem.fromJson(x))),
  );
}

class LikedItem {
  LikedItem({
    this.id,
    this.vehicle,
  });

  int? id;
  Vehicle? vehicle;

  factory LikedItem.fromJson(Map<String, dynamic> json) => LikedItem(
    id: json["id"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

}