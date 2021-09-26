import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final Function onNextPage;
  const MovieSlider({Key? key, required this.movies, required this.onNextPage})
      : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scroll = new ScrollController();
  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.green,
      height: 220.0,
      margin: EdgeInsets.only(top: 30.0),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Populares",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView.builder(
              controller: _scroll,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, index) {
                final movie = widget.movies[index];
                print(movie.fullImagePosterPath);
                return _MoviePoster(movie: movie);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: 150.0,
      height: 220.0,
      //color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailed', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/imagenes/no-image.jpg'),
                  image: NetworkImage(movie.fullImagePosterPath)),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            movie.title,
            //style: TextStyle(backgroundColor: Colors.blue),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
