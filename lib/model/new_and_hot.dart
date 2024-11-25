// To parse this JSON data, do
//
//     final newAndHotList = newAndHotListFromJson(jsonString);

import 'dart:convert';

NewAndHotList newAndHotListFromJson(String str) => NewAndHotList.fromJson(json.decode(str));

String newAndHotListToJson(NewAndHotList data) => json.encode(data.toJson());

class NewAndHotList {
  List<Datum>? data;

  NewAndHotList({
    this.data,
  });

  factory NewAndHotList.fromJson(Map<String, dynamic> json) => NewAndHotList(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? title;
  int? year;
  Type? type;
  List<Genres>? genre;
  String? rating;
  String? duration;
  String? language;
  String? description;
  String? posterUrl;
  bool? isFree;
  bool? isNewRelease;
  int? seasons;

  Datum({
    this.id,
    this.title,
    this.year,
    this.type,
    this.genre,
    this.rating,
    this.duration,
    this.language,
    this.description,
    this.posterUrl,
    this.isFree,
    this.isNewRelease,
    this.seasons,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    year: json["year"],
    type: typeValues.map[json["type"]]!,
    genre: json["genre"] == null ? [] : List<Genres>.from(json["genre"]!.map((x) => genreValues.map[x]!)),
    rating: json["rating"],
    duration: json["duration"],
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
    "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => genreValues.reverse[x])),
    "rating": rating,
    "duration": duration,
    "language": language,
    "description": description,
    "poster_url": posterUrl,
    "is_free": isFree,
    "is_new_release": isNewRelease,
    "seasons": seasons,
  };
}

enum Genres {
  COMIC,
  CRIME,
  ROMANCE,
  SCI_FI,
  THRILLER
}

final genreValues = EnumValues({
  "Comic": Genres.COMIC,
  "Crime": Genres.CRIME,
  "Romance": Genres.ROMANCE,
  "Sci-fi": Genres.SCI_FI,
  "Thriller": Genres.THRILLER
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
