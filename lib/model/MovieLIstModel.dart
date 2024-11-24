// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toJson());

class MovieList {
  List<Movie>? data;

  MovieList({
    this.data,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
    data: json["data"] == null ? [] : List<Movie>.from(json["data"]!.map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Movie {
  int? id;
  String? title;
  int? year;
  Type? type;
  List<String>? genre;
  double? rating;
  String? language;
  String? description;
  String? posterUrl;
  bool? isFree;
  bool? isNewRelease;
  int? seasons;

  Movie({
    this.id,
    this.title,
    this.year,
    this.type,
    this.genre,
    this.rating,
    this.language,
    this.description,
    this.posterUrl,
    this.isFree,
    this.isNewRelease,
    this.seasons,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    title: json["title"],
    year: json["year"],
    type: typeValues.map[json["type"]]!,
    genre: json["genre"] == null ? [] : List<String>.from(json["genre"]!.map((x) => x)),
    rating: json["rating"]?.toDouble(),
    language: json["language"],
    description: json["description"],
    posterUrl: json["poster_url"],
    isFree: json["is_free"],
    isNewRelease: json["is_new_release"],
    seasons: json["seasons"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "year": year,
    "type": typeValues.reverse[type],
    "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => x)),
    "rating": rating,
    "language": languageValues.reverse[language],
    "description": description,
    "poster_url": posterUrl,
    "is_free": isFree,
    "is_new_release": isNewRelease,
    "seasons": seasons,
  };
}

enum Language {
  ENGLISH,
  HINDI,
  MALAYALAM,
  SPANISH,
  TAMIL
}

final languageValues = EnumValues({
  "English": Language.ENGLISH,
  "Hindi": Language.HINDI,
  "Malayalam": Language.MALAYALAM,
  "Spanish": Language.SPANISH,
  "Tamil": Language.TAMIL
});

enum Type {
  MOVIE,
  SERIES
}

final typeValues = EnumValues({
  "movie": Type.MOVIE,
  "series": Type.SERIES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
