import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/film.dart';

class FilmRow extends StatelessWidget {
  final Film film;

  const FilmRow({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(film.title, style: TextStyle(fontStyle: FontStyle.italic, )),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Release on ${film.release_date}", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
          Text("Description :  ${film.description}  "
              , style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)) ,
          Text(
          "Directed by : ${film.director}", style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
  Text("Duration : ${film.running_time}", style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold))
,
          Image.network(
            '${film.image}',
            width: 200,
            height: 200
          )

        ],
      ),
    );
  }
}