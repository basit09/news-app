// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    required this.statusCode,
    required this.version,
    required this.access,
    required this.data,
  });

  String status;
  int statusCode;
  String version;
  String access;
  List<Datum> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    statusCode: json["status-code"],
    version: json["version"],
    access: json["access"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status-code": statusCode,
    "version": version,
    "access": access,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.summary,
    required this.link,
    required this.published,
    required this.image,
  });

  int id;
  String title;
  String summary;
  String link;
  String published;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    summary: json["summary"] == null ? null : json["summary"],
    link: json["link"],
    published: json["published"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary == null ? null : summary,
    "link": link,
    "published": published,
    "image": image == null ? null : image,
  };
}
