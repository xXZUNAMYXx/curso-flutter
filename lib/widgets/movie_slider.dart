import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    Key? key,
    this.titlePopular,
    required this.movies,
  }) : super(key: key);

  final String? titlePopular;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 250,
      color: Colors.grey,
      child: Column(
        children: [
          //Padding
          /* Container(
            if ( titlePopular != null ){
              child: , */
          if (titlePopular != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(titlePopular!),
            ),
          /*  },
          ),   */

          Expanded(
            child: ListView.builder(
              //controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key, 
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg), 
                width: 130,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
