import 'package:flutter/material.dart';
import 'package:peliculas_app/src/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'src/pages/screens_export.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  //const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'detailed': (context) => DetailedPage()
      },
    );
  }
}
