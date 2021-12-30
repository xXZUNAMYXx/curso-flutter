import 'package:flutter/material.dart';
import 'package:peliculas/providers/providers.dart';

import 'package:peliculas/screens/screens.dart';
import 'package:peliculas/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Lazyy false hace que por defecto inicie el provider y lo colocamos a rriba en el arbol de widgets en este ejemplo
        ChangeNotifierProvider(create: (context) => MoviesProvider(), lazy: false),
      ],
      
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        initialRoute: 'details',
        routes: {
          'home'    : (context) => const HomeScreen(),
          'details' : (context) => const DetailsScreen()
        },
        
        theme: AppTheme().lightTheme,
    );
      
  }
}
