// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString?);

import 'dart:convert';
import 'package:reddit_clone_test/model/welcome_data.dart';

Welcome welcomeFromJson(String? str) => Welcome.fromJson(json.decode(str!));

String? welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.kind,
    required this.data,
  });

  String? kind;
  WelcomeData data;

  factory Welcome.fromJson(Map<String?, dynamic> json) => Welcome(
        kind: json["kind"],
        data: WelcomeData.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
      };
}
