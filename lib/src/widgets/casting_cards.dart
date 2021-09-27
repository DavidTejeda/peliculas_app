import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/cast_response.dart';
import 'package:peliculas_app/src/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieid;
  const CastingCard({Key? key, required this.movieid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieid),
//      initialData: [],
      builder: (_, AsyncSnapshot<List<CastElement>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(bottom: 40),
            height: 190.0,
            width: double.infinity,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<CastElement> cast = snapshot.data!;
        return Container(
          margin: EdgeInsets.only(bottom: 40),
          height: 190.0,
          width: double.infinity,
          //color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (context, index) {
              return _CastCard(actor: cast[index]);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final CastElement actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150.0,
              width: 100,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/imagenes/no-image.jpg'),
              image: NetworkImage(actor.fullImageProfilePath),
            ),
          ),
          Text(actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(height: 1.2))
        ],
      ),
    );
  }
}
