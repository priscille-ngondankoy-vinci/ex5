import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Anime {
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";

  final String id;
  final String title;
  final String image;
  final String description;
  final String release_date;
  final String running_time;
  final String rt_score;


  Anime({required this.id, required this.title, required this.image, required
  this.description, required this.release_date,
      required this.running_time, required this.rt_score});



  @override
  String toString() =>
      'Anime: $title, release on  $release_date, $running_time min, score : $rt_score ,description: $description, image: $image';

  static Future<Anime> fetchAnime(int id) async {
    var response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movie");
    }

    final jsonObj = jsonDecode(response.body);

    return Anime(
      id: jsonObj["id"],
      title: jsonObj["title"],
      description: jsonObj["description"],
      release_date: jsonObj["release_date"],
      running_time: jsonObj["running_time"], image: jsonObj["image"],
      rt_score: jsonObj["rt_score"]
    );
  }
  static Future<List<Anime>> fetchAnimes() async {
    var response = await http.get(Uri.parse("$baseUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Anime>((jsonObj) => Anime(
        id: jsonObj["id"],
        title: jsonObj["title"],
        description: jsonObj["description"],
        release_date: jsonObj["release_date"],
        running_time: jsonObj["running_time"],
        rt_score: jsonObj["rt_score"], image: jsonObj["image"]
      )).toList();
    }, response.body);
  }
}