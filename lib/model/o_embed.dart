class Oembed {
  Oembed({
    this.providerUrl,
    this.version,
    this.title,
    this.type,
    this.thumbnailWidth,
    this.height,
    this.width,
    this.html,
    this.authorName,
    this.providerName,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.authorUrl,
  });

  String? providerUrl;
  String? version;
  String? title;
  String? type;
  int? thumbnailWidth;
  int? height;
  int? width;
  String? html;
  String? authorName;
  String? providerName;
  String? thumbnailUrl;
  int? thumbnailHeight;
  String? authorUrl;

  factory Oembed.fromJson(Map<String?, dynamic> json) => Oembed(
        providerUrl: json["provider_url"],
        version: json["version"],
        title: json["title"],
        type: json["type"],
        thumbnailWidth: json["thumbnail_width"],
        height: json["height"],
        width: json["width"],
        html: json["html"],
        authorName: json["author_name"],
        providerName: json["provider_name"],
        thumbnailUrl: json["thumbnail_url"],
        thumbnailHeight: json["thumbnail_height"],
        authorUrl: json["author_url"],
      );

  Map<String?, dynamic> toJson() => {
        "provider_url": providerUrl,
        "version": version,
        "title": title,
        "type": type,
        "thumbnail_width": thumbnailWidth,
        "height": height,
        "width": width,
        "html": html,
        "author_name": authorName,
        "provider_name": providerName,
        "thumbnail_url": thumbnailUrl,
        "thumbnail_height": thumbnailHeight,
        "author_url": authorUrl,
      };
}
