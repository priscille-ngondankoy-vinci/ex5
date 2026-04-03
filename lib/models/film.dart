import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Film {
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";

  final String id;
  final String title;
  final String image;
  final String description;
  final String release_date;
  final String running_time;
  final String director;
  final String rt_score;

  Film({required this.id, required this.title, required this.image, required
  this.description, required this.release_date,
      required this.running_time, required this.director, required this.rt_score});

  String toString() =>
      'Film: $title, director : $director,  description : $description, $running_time min, '
          'release_date : $release_date, rt_score: $rt_score';

  static Future<List<Film>> fetchFilms() async {
    var response = await http.get(Uri.parse("$baseUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Film>((jsonObj) => Film(
        id: jsonObj["id"],
        title: jsonObj["title"],
        description: jsonObj["description"],
        release_date: jsonObj["release_date"],
        running_time: jsonObj["running_time"], image: jsonObj["image"], rt_score: jsonObj["rt_score"], director: jsonObj["director"]
      )).toList();
    }, response.body);
  }


}
