// To parse this JSON data, do
//
//     final SellerProfile = SellerProfileFromJson(jsonString);

import 'dart:convert';
import './vehicles_model.dart';

SellerProfileModel sellerProfileModelFromJson(String str) => SellerProfileModel.fromJson(json.decode(str));

String sellerProfileModelToJson(SellerProfileModel data) => json.encode(data.toJson());

class SellerProfileModel {
  SellerProfileModel({
    this.id, this.user,
    this.postCount, this.followers,
    this.whatsappContact,
    this.address, this.city,
    this.country, this.bio,
    this.vehicles,
  });

  int? id;
  String? user;
  int? postCount;
  int? followers;
  int? whatsappContact;
  String? address;
  String? city;
  String? country;
  String? bio;
  List<Vehicle>? vehicles;

  factory SellerProfileModel.fromJson(Map<String, dynamic> json) => SellerProfileModel(
    id: json["id"],
    user: json["user"],
    postCount: json["post_count"],
    followers: json["followers"],
    whatsappContact: json["whatsapp_contact"],
    address: json["address"],
    city: json["city"],
    country: json["country"],
    bio: json["bio"],
    vehicles: List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "whatsapp_contact": whatsappContact,
    "address": address,
    "city": city,
    "country": country,
    "bio":bio,
  };
}