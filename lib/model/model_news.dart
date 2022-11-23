class NewsDataModel {
  List<News>? news;
  NewsDataModel({this.news});
  NewsDataModel.fromJson(List<dynamic> json) {
    if (json != null) {
      news = <News>[];
      json.forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['*'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  final int? id;
  final String? title;
  final String? shortDescription;
  final String? thumbnail;
  final String? mainImage;
  final String? articleContent;
  final String? articleUrl;

  News({
    this.id,
    this.title,
    this.shortDescription,
    this.thumbnail,
    this.mainImage,
    this.articleContent,
    this.articleUrl,
  });

  News.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        shortDescription = json['short_description'] as String?,
        thumbnail = json['thumbnail'] as String?,
        mainImage = json['main_image'] as String?,
        articleContent = json['article_content'] as String?,
        articleUrl = json['article_url'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'short_description': shortDescription,
        'thumbnail': thumbnail,
        'main_image': mainImage,
        'article_content': articleContent,
        'article_url': articleUrl
      };
}
