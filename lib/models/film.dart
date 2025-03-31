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
  final String director;
  final String running_time;
  final String rt_score;

  const Film({
    required this.id,
    required this.title,
    required this.director,
    required this.image,
    required this.description,
    required this.release_date,
    required this.running_time,
    required this.rt_score
  });

  @override
  String toString() {
    return 'Film{id: $id, title: $title, image: $image, description: $description, release_date: $release_date, director: $director, running_time: $running_time, rt_score: $rt_score}';
  }
  static Future<List<Film>> fetchFilms() async {
    var response = await http.get(Uri.parse("$baseUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((String input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Film>((jsonObj) => Film(
        id: jsonObj["id"],
        title: jsonObj["title"],
        director: jsonObj["director"],
        description: jsonObj["description"],
        running_time: jsonObj["running_time"],
        image: jsonObj["image"],
        release_date: jsonObj["release_date"],
        rt_score: jsonObj["rt_score"]
      )).toList();
    }, response.body);
  }
}
