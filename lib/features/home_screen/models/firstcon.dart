import 'dart:convert';

class FirstConModel {
  final int malId;
  final String title;
  final String imageUrl;
  final String synopsis;
  final String type;
  final String airingStart;
  

  FirstConModel({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.type,
    required this.airingStart,
    
  });

  factory FirstConModel.fromJson(Map<String, dynamic> json) {
    return FirstConModel(
      malId: json['mal_id'] ?? '',
      title: json['title'],
      imageUrl: json['images']['jpg']['large_image_url'],
      synopsis: json['synopsis'] ?? '',
      type: json['type'] ?? '',
      airingStart: json['airing_start'] ?? '',
     
    );
  }
}

List<FirstConModel> parseAnimes(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed
      .map<FirstConModel>((json) => FirstConModel.fromJson(json))
      .toList();
}
