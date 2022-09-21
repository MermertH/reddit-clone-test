import 'package:reddit_clone_test/model/image.dart';

class Preview {
  List<Image>? images;
  bool? enabled;
  Preview({
    this.images,
    this.enabled,
  });

  factory Preview.fromJson(Map<String?, dynamic> json) => Preview(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        enabled: json["enabled"],
      );

  Map<String?, dynamic> toJson() => {
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "enabled": enabled,
      };
}
