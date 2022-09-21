import 'package:reddit_clone_test/model/child_data.dart';

class Child {
  String? kind;
  ChildData data;
  Child({
    required this.kind,
    required this.data,
  });

  factory Child.fromJson(Map<String?, dynamic> json) => Child(
        kind: json["kind"],
        data: ChildData.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
      };
}
