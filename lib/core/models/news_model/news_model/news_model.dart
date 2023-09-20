import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/core/models/news_model/article_model/article_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
base class NewsModel {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "totalResults")
  final int totalResults;
  @JsonKey(name: "articles")
  final List<ArticleModel> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
