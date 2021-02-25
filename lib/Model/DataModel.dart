// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.title,
    this.description,
    this.imageUrl,
    this.views,
    this.type,
    this.duration,
  });

  String title;
  String description;
  String imageUrl;
  String views;
  String type;
  String duration;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
    views: json["views"] == null ? null : json["views"],
    type: json["type"] == null ? null : json["type"],
    duration: json["duration"] == null ? null : json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "image_url": imageUrl == null ? null : imageUrl,
    "views": views == null ? null : views,
    "type": type == null ? null : type,
    "duration": duration == null ? null : duration,
  };


}
