class MediaEmbed {
  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  String? content;
  int? width;
  bool? scrolling;
  int? height;
  String? mediaDomainUrl;

  factory MediaEmbed.fromJson(Map<String?, dynamic> json) => MediaEmbed(
        content: json["content"] ?? null,
        width: json["width"] ?? null,
        scrolling: json["scrolling"] ?? null,
        height: json["height"] ?? null,
        mediaDomainUrl: json["media_domain_url"] ?? null,
      );

  Map<String?, dynamic> toJson() => {
        "content": content ?? null,
        "width": width ?? null,
        "scrolling": scrolling ?? null,
        "height": height ?? null,
        "media_domain_url": mediaDomainUrl ?? null,
      };
}
