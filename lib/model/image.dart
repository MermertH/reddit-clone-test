import 'package:reddit_clone_test/model/gildings.dart';
import 'package:reddit_clone_test/model/source.dart';

class Image {
  Source? source;
  List<Source>? resolutions;
  Gildings? variants;
  String? id;
  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  factory Image.fromJson(Map<String?, dynamic> json) => Image(
        source: Source.fromJson(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromJson(x))),
        variants: Gildings.fromJson(json["variants"]),
        id: json["id"],
      );

  Map<String?, dynamic> toJson() => {
        "source": source!.toJson(),
        "resolutions": List<dynamic>.from(resolutions!.map((x) => x.toJson())),
        "variants": variants!.toJson(),
        "id": id,
      };
}
