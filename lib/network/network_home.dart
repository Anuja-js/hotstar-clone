import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hotstar/model/genre_model.dart';
import 'package:hotstar/model/language_model.dart';
import 'package:hotstar/model/movie_list_model.dart';
import 'package:hotstar/model/new_and_hot.dart';
import 'package:http/http.dart' as http;

import '../model/match_list.dart';

class HomeNetWork{
  getLangaugeData()async{
    final url=Uri.parse("https://run.mocky.io/v3/b57273db-b4db-43d0-ac29-117a2745ae3f");
    final response=await http.get(url,headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      LanguageList latestFromJson = LanguageList.fromJson(json.decode(response.body));
      return latestFromJson.languages;



    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
   getNewAndHotData()async{
    final url=Uri.parse("https://run.mocky.io/v3/690efb15-7d3f-4d3f-a854-20d8af209eea");
    final response=await http.get(url,headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      NewAndHotList latestFromJson = NewAndHotList.fromJson(json.decode(response.body));
      return latestFromJson.data;



    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  getMatchData()async{
    final url=Uri.parse("https://run.mocky.io/v3/d16a1a3c-0928-4361-8fbf-ca9e62d381fa");
    final response=await http.get(url,headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      MatchesList latestFromJson = MatchesList.fromJson(json.decode(response.body));
      return latestFromJson.matches;



    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
  getGenreData()async{
    final url=Uri.parse("https://run.mocky.io/v3/ead387c4-c697-43d6-9490-9e7c1656d376");
    final response=await http.get(url,headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      GenreList latestFromJson = GenreList.fromJson(json.decode(response.body));
      return latestFromJson.genres;



    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
getMovieData()
  async {
    final url = Uri.parse('https://run.mocky.io/v3/b56a4a1e-48d6-4667-8873-ae57fa7c0ab2');
    final response = await http.get(url,headers: {
      'content-type': 'application/json',
    },
    );
    if (response.statusCode == 200) {
      MovieList latestFromJson = MovieList.fromJson(json.decode(response.body));
      return latestFromJson.data;



    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
}