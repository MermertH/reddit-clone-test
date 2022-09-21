import 'package:reddit_clone_test/model/o_embed.dart';

class Media {
  Media({
    required this.type,
    required this.oembed,
  });

  String? type;
  Oembed oembed;

  factory Media.fromJson(Map<String?, dynamic> json) => Media(
        type: json["type"],
        oembed: Oembed.fromJson(json["oembed"]),
      );

  Map<String?, dynamic> toJson() => {
        "type": type,
        "oembed": oembed.toJson(),
      };
}
