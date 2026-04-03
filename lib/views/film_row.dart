import 'package:flutter/material.dart';

import '../models/film.dart';

class FilmRow extends StatelessWidget {
  final Film film;

  const FilmRow({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(film.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description :  ${film.description} - ${film.running_time} minutes ,  "
              "Directed by : ${film.director}"),

        ],
      ),
    );
  }
}