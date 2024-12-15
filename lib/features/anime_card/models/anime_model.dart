class AnimeModel {
  final String url;
  final int malId;
  final String title;
  final String imageUrl;
  final String trailerUrl;
  final String trailerImage;
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
  final String source;
  AnimeModel({
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
    required this.source,
    required this.trailerImage,
  });
  factory AnimeModel.fromJson(json) {
    return AnimeModel(
      malId: json["data"]['mal_id'] ?? '',
      title: json["data"]['title'],
      imageUrl: json["data"]['images']['jpg']['image_url'],
      synopsis: json["data"]["synopsis"],
      airingStart: json["data"]['airing_start'] ?? '',
      url: json["data"]['url'] ?? 'Unknown',
      trailerUrl: json["data"]["trailer"]["url"] ?? 'Unknown',
      noEps: json["data"]["episodes"].toString(),
      states: json["data"]["status"] ?? 'Unknown',
      airedDate: json["data"]["aired"]["string"] ?? 'Unknown',
      duration: json["data"]["duration"] ?? 'Unknown',
      season: json["data"]["season"] ?? 'Unknown',
      day: json["data"]["broadcast"]["string"] ?? 'Unknown',
      score: json["data"]["score"].toString() ,
      type: json["data"]['type'] ?? '',
      year: json["data"]["year"].toString(),
      source: json["data"]["source"],
      trailerImage:
          json["data"]["trailer"]["images"]["medium_image_url"] ?? 'Unknown',
    );
  }
}
