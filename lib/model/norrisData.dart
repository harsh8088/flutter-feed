class NorrisData {
  final String category;
  final String icon_url;
  final String id;
  final String url;
  final String value;

  NorrisData({this.category, this.icon_url, this.id, this.url, this.value});

  factory NorrisData.fromJson(Map<String, dynamic> json) {
    return NorrisData(
      category: json['category'],
      icon_url: json['icon_url'],
      id: json['id'],
      url: json['url'],
      value: json['value']
    );
  }
}
