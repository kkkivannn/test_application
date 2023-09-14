class UrlModel {
  final String url;

  UrlModel({required this.url});
  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
        url: json['remote_url'],
      );
}
