// To parse this JSON data, do
//
//     final MatchesList = MatchesListFromJson(jsonString);

import 'dart:convert';

MatchesList MatchesListFromJson(String str) => MatchesList.fromJson(json.decode(str));

String MatchesListToJson(MatchesList data) => json.encode(data.toJson());

class MatchesList {
  List<Matches>? matches;

  MatchesList({
    this.matches,
  });

  factory MatchesList.fromJson(Map<String, dynamic> json) => MatchesList(
    matches: json["matches"] == null ? [] : List<Matches>.from(json["matches"]!.map((x) => Matches.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
  };
}

class Matches {
  int? id;
  String? name;
  bool? isLive;
  String? time;
  String? imageUrl;

  Matches({
    this.id,
    this.name,
    this.isLive,
    this.time,
    this.imageUrl,
  });

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
    id: json["id"],
    name: json["name"],
    isLive: json["is_live"],
    time: json["time"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_live": isLive,
    "time": time,
    "image_url": imageUrl,
  };
}
