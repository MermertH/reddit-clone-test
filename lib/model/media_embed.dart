class MediaEmbed {
  String? content;
  int? width;
  bool? scrolling;
  int? height;
  String? mediaDomainUrl;

  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  factory MediaEmbed.fromJson(Map<String?, dynamic> json) => MediaEmbed(
        content: json["content"] ?? '',
        width: json["width"] ?? 0,
        scrolling: json["scrolling"] ?? false,
        height: json["height"] ?? 0,
        mediaDomainUrl: json["media_domain_url"] ?? '',
      );

  Map<String?, dynamic> toJson() => {
        "content": content ?? '',
        "width": width ?? 0,
        "scrolling": scrolling ?? false,
        "height": height ?? 0,
        "media_domain_url": mediaDomainUrl ?? '',
      };
}
