import 'package:reddit_clone_test/model/child.dart';

class WelcomeData {
  dynamic after;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<Child> children;
  String? before;
  WelcomeData({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    required this.children,
    this.before,
  });

  factory WelcomeData.fromJson(Map<String?, dynamic> json) => WelcomeData(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        before: json["before"],
      );

  Map<String?, dynamic> toJson() => {
        "after": after,
        "dist": dist,
        "modhash": modhash,
        "geo_filter": geoFilter,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "before": before,
      };
}
