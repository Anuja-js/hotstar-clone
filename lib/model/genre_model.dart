// To parse this JSON data, do
//
//     final genreList = genreListFromJson(jsonString);

import 'dart:convert';

GenreList genreListFromJson(String str) => GenreList.fromJson(json.decode(str));

String genreListToJson(GenreList data) => json.encode(data.toJson());

class GenreList {
  List<Genre>? genres;

  GenreList({
    this.genres,
  });

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
  };
}

class Genre {
  int? id;
  String? name;
  String? bannerImageUrl;
  String? description;

  Genre({
    this.id,
    this.name,
    this.bannerImageUrl,
    this.description,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
    bannerImageUrl: json["banner_image_url"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "banner_image_url": bannerImageUrl,
    "description": description,
  };
}
