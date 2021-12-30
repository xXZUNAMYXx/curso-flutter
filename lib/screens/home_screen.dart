import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/providers/providers.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final moviesProvider = Provider.of<MoviesProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //presenta error
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ), 

            MovieSlider(
              movies: moviesProvider.popularMovies,
              titlePopular: 'Populares!',
            ),
          ],
        ),
      ),
    );
  }
}
