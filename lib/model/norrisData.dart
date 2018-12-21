class NorrisData {
  final String category;
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  NorrisData({this.category, this.iconUrl, this.id, this.url, this.value});

  factory NorrisData.fromJson(Map<String, dynamic> json) {
    return NorrisData(
      category: json['category'],
      iconUrl: json['icon_url'],
      id: json['id'],
      url: json['url'],
      value: json['value']
    );
  }
}
