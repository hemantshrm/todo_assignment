import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userModel,
  });

  RxList<Rx<User>>? userModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userModel: json["userModel"] != null
            ? RxList<Rx<User>>.from(
                json["userModel"].map((x) => User.fromJson(x).obs))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "userModel": RxList<dynamic>.from(userModel!.map((x) => x.toJson())),
      };
}

class User extends Equatable {
  const User({this.phone, this.pass});

  final String? phone;
  final String? pass;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phone: json["phone"],
        pass: json["pass"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "pass": pass,
      };
  //
  // @override
  // bool get stringify => true;

  @override
  List<Object?> get props => [phone, pass];
}
