import 'package:json_annotation/json_annotation.dart';

part 'url_model.g.dart';

@JsonSerializable()
base class UrlModel {
  @JsonKey(name: 'remote_url')
  final String url;

  UrlModel({required this.url});

  factory UrlModel.fromJson(Map<String, dynamic> json) => _$UrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrlModelToJson(this);
}
