import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  //const MovieSlider({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190.0,
      margin: EdgeInsets.only(top: 30.0),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Populares")),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => _MoviePoster(),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: 150.0,
      height: 190.0,
      //color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailed'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/imagenes/no-image.jpg'),
                  image: AssetImage('assets/imagenes/no-image.jpg')),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Star Wars",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
