import 'dart:convert';

import 'package:get/get.dart';

Annotations annotationsFromJson(String str) =>
    Annotations.fromJson(json.decode(str));

String annotationsToJson(Annotations data) => json.encode(data.toJson());

class Annotations {
  Annotations({
    this.annotations,
  });

  RxList<Rx<Annotation>>? annotations;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        annotations: json["annotations"] != null
            ? RxList<Rx<Annotation>>.from(
                json["annotations"].map((x) => Annotation.fromJson(x).obs))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "annotations":
            RxList<dynamic>.from(annotations!.map((x) => x.toJson())),
      };
}

class Annotation {
  Annotation(
      {this.title, this.date, this.check, this.description, this.category});

  String? title;
  String? date;
  bool? check;
  String? description;
  String? category;

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        title: json["title"],
        date: json["date"],
        check: json["check"],
        description: json["description"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "check": check,
        "description": description,
        "category": category,
      };
}
