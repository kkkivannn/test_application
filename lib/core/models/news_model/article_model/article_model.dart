import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/core/models/news_model/source_model/source_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
base class ArticleModel {
  @JsonKey(name: "source")
  final SourceModel source;
  @JsonKey(name: "author")
  final dynamic author;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "urlToImage")
  final String urlToImage;
  @JsonKey(name: "publishedAt")
  final DateTime publishedAt;
  @JsonKey(name: "content")
  final dynamic content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
