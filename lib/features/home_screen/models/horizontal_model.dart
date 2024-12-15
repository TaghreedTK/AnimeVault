import 'dart:convert';

class HorizontalModel {
  final String url;
  final int malId;
  final String title;
  final String imageUrl;
  final String trailerUrl;
  final String noEps;
  final String states;
  final String airedDate;
  final String duration;
  final String synopsis;
  final String season;
    final String year;
  final String day;
  final String airingStart;
  final String score;
    final String type;

  

  HorizontalModel({
    required this.airedDate,
    required this.day,
    required this.duration,
    required this.noEps,
    required this.season,
    required this.states,
    required this.trailerUrl,
    required this.url,
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.airingStart,
    required this.score,
     required this.type,
        required this.year,
  });

  factory HorizontalModel.fromJson(Map<String, dynamic> json) {
    return HorizontalModel(
      malId: json['mal_id'] ?? '',
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      synopsis: json["synopsis"] ?? '',
      airingStart: json['airing_start'] ?? '',
      url: json['url'] ?? 'Unknown',
      trailerUrl: json["trailer"]["url"] ?? 'Unknown',
      noEps: json["episodes"].toString() ,
      states: json["status"] ?? 'Unknown',
      airedDate: json["aired"]["string"] ?? 'Unknown',
      duration: json["duration"] ?? 'Unknown',
      season: json["season"] ?? 'Unknown',
      day: json["broadcast"]["day"] ?? 'Unknown',
      score: json["score"].toString() ,
      type: json['type'] ?? '',
      year:json["year"].toString() 
    );
  }
}

List<HorizontalModel> parseAnimes(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed
      .map<HorizontalModel>((json) => HorizontalModel.fromJson(json))
      .toList();
}
