import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable()
base class SourceModel {
  @JsonKey(name: "id")
  final dynamic id;
  @JsonKey(name: "name")
  final String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
