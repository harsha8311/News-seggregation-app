class Headline {
  final String title;
  final String url;
  final int id;
  final String sentiment;

  // Constructor with named parameters and required sentiment
  Headline({
    this.title = '',
    this.url = '',
    this.id = 0,
    required this.sentiment,
  });

  // Factory constructor to create a Headline from JSON data
  factory Headline.fromJson(Map<String, dynamic> json) {
    return Headline(
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      id: json['id'] ??
          0, // Default value of 0 if 'id' is not present in the JSON
      sentiment: json['sentiment'] ??
          '', // Default to empty string if sentiment is missing
    );
  }

  // Method to convert Headline to JSON format
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'id': id,
      'sentiment': sentiment,
    };
  }

  @override
  String toString() {
    return 'Headline(title: $title, url: $url, id: $id, sentiment: $sentiment)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Headline &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          url == other.url &&
          id == other.id &&
          sentiment == other.sentiment);

  @override
  int get hashCode =>
      title.hashCode ^ url.hashCode ^ id.hashCode ^ sentiment.hashCode;
}
