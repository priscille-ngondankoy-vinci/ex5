import 'package:flutter/material.dart';

import '../models/anime.dart';
import 'anime_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Studio Ghibli Movies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: Future.delayed(
              const Duration(seconds: 3),
                  () => Anime.fetchAnimes(),
            ),
          builder: (context, snapshot) {
            if (snapshot.hasData) { // Completed with a value
              final animes = snapshot.data!;
              return ListView.separated(
                itemCount: animes.length,
                itemBuilder: (context, index) => AnimeRow(anime: animes[index]),
                separatorBuilder: (context, index) => const Divider(),
              );
            }

            if (snapshot.hasError) { // Completed with an error
              return Center(child: Text("${snapshot.error}"));
            }

            // Uncompleted
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}