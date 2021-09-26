import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/src/widgets/widgets.dart';

class DetailedPage extends StatelessWidget {
  //const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);
    return Scaffold(
      body: CustomScrollView(
        //controlan la accion de como interactuan los elementos al hacer scroll, recibe como propiedades elementos de tipo slivers
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            SizedBox(
              height: 20,
            ),
            _OverView(movie: movie),
            SizedBox(height: 20),
            CastingCard(movieid: movie.id)
          ]))
        ],
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              height: 150.0,
              width: 100,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/imagenes/no-image.jpg'),
              image: NetworkImage(movie.fullImagePosterPath),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline6,
                  )),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 160),
                child: Text(movie.originalTitle,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(movie.releaseDate.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text(movie.voteAverage.toString()),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.all(0),
          title: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.black45,
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          background: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/imagenes/loading.gif'),
              image: NetworkImage(movie.fullImagePosterPath)),
        ));
  }
}
