class BannerModel {
  final String url;

  BannerModel({required this.url});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(url: json['url']);
  }
}
