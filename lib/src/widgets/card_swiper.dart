import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwipper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwipper({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: deviceSize.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Swiper(
        itemCount: movies.length,
        //layout: SwiperLayout.STACK,
        itemHeight: deviceSize.height * 0.1,
        itemWidth: deviceSize.width * 0.1,
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (_, index) {
          final movie = movies[index];
          //print(movie.posterPath);
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailed', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                movie.fullImagePosterPath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      width: double.infinity,
      height: deviceSize.height * 0.4,
    );
  }
}
