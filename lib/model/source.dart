class Source {
  Source({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Source.fromJson(Map<String?, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String?, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
