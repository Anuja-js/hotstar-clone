import 'dart:convert';
import 'package:hotstar/model/MovieLIstModel.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeNetWork{
getMovieData()
  async {
    final url = Uri.parse('https://run.mocky.io/v3/b56a4a1e-48d6-4667-8873-ae57fa7c0ab2');
    final response = await http.get(url,headers: {
      'content-type': 'application/json',
    },
    );
    if (response.statusCode == 200) {
      MovieList latestFromJson = MovieList.fromJson(json.decode(response.body));
      Logger().w("bcvnbvcx");
      return latestFromJson.data;



    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}