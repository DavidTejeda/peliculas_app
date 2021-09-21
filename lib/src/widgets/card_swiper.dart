import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/src/pages/detailed_page.dart';

class CardSwipper extends StatelessWidget {
  //const CardSwipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Swiper(
        itemCount: 10,
        //layout: SwiperLayout.STACK,
        itemHeight: deviceSize.height * 0.1,
        itemWidth: deviceSize.width * 0.1,
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailed'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://www.hola.com/imagenes/estar-bien/20190820147813/razas-perros-pequenos-parecen-grandes/0-711-550/razas-perro-pequenos-grandes-m.jpg",
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
