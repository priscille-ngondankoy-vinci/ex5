import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/anime.dart';

class AnimeRow extends StatelessWidget {
  final Anime anime;

  const AnimeRow({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anime.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description :  ${anime.description} - ${anime.running_time} minutes"),
          InkWell(
            onTap: () => launchUrl(Uri.parse(anime.image)),
            child: Text(anime.image),
          )
        ],
      ),
    );
  }
}