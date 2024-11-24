// To parse this JSON data, do
//
//     final languageList = languageListFromJson(jsonString);

import 'dart:convert';

LanguageList languageListFromJson(String str) => LanguageList.fromJson(json.decode(str));

String languageListToJson(LanguageList data) => json.encode(data.toJson());

class LanguageList {
  List<Language>? languages;

  LanguageList({
    this.languages,
  });

  factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
    languages: json["languages"] == null ? [] : List<Language>.from(json["languages"]!.map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x.toJson())),
  };
}

class Language {
  int? id;
  String? name;
  String? bannerImageUrl;
  String? description;

  Language({
    this.id,
    this.name,
    this.bannerImageUrl,
    this.description,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
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
