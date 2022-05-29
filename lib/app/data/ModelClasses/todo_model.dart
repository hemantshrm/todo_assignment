import 'dart:convert';

import 'package:get/get.dart';

Annotations annotationsFromJson(String str) =>
    Annotations.fromJson(json.decode(str));

String annotationsToJson(Annotations data) => json.encode(data.toJson());

class Annotations {
  Annotations({
    this.annotations,
  });

  RxList<Rx<TodoModel>>? annotations;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        annotations: json["annotations"] != null
            ? RxList<Rx<TodoModel>>.from(
                json["annotations"].map((x) => TodoModel.fromJson(x).obs))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "annotations":
            RxList<dynamic>.from(annotations!.map((x) => x.toJson())),
      };
}

class TodoModel {
  TodoModel(
      {this.title, this.date, this.check, this.description, this.category});

  String? title;
  String? date;
  bool? check;
  String? description;
  String? category;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
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
