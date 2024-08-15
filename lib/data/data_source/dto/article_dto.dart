class ArticleDto {
  const ArticleDto({
    this.id,
    this.title,
    this.body,
    this.image,
  });

  final String? id;
  final String? title;
  final String? body;
  final String? image;

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return ArticleDto(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "image": image,
    };
  }
}
