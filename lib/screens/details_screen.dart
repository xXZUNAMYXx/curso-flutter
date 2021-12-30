import 'package:flutter/material.dart';

import 'package:peliculas/themes/app_theme.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const _Overview(),
              const CastingCards(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primaryColorApp,
      expandedHeight: 200,
      floating: false,
      pinned: true,

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'Movie-Title',
            style: TextStyle(fontSize: 20),
          ),
        ),

        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'home',
                arguments: 'movie-instance'),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/300x400'),
              height: 150,
            ),
          ),

          Column(
            children: [
              const Text('Titilo Principal'),
              const SizedBox(height: 5),
              const Text('Titulo ogiginal'),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Icon(Icons.star_border_sharp),
                  Text('Calificacion de la pelicula')
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text('Texto con la descripcion de la pelicula para relleno.Texto con la descripcion de la pelicula para relleno.Texto con la descripcion de la pelicula para relleno.'),
    );
  }
}