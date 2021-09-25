import 'package:flutter/material.dart';
import 'package:peliculas_app/src/widgets/widgets.dart';

class DetailedPage extends StatelessWidget {
  //const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //controlan la accion de como interactuan los elementos al hacer scroll, recibe como propiedades elementos de tipo slivers
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            SizedBox(
              height: 20,
            ),
            _OverView(),
            _OverView(),
            _OverView(),
            SizedBox(height: 20),
            CastingCard()
          ]))
        ],
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  //const _PosterAndTitle({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
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
              image: NetworkImage(
                  'https://cdn2.excelsior.com.mx/media/styles/image800x600/public/pictures/2021/06/09/2592367.jpg'),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('title',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              Text('title.original',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              Text('subtitles',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text('votos'),
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
  //const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        'Nostrud qui nostrud nisi enim excepteur excepteur amet irure anim. Deserunt duis esse dolor enim nostrud incididunt. Minim officia consequat aliquip Lorem aliqua nostrud excepteur veniam consequat culpa fugiat fugiat officia dolore. Incididunt consectetur consectetur nulla velit. Incididunt consequat dolore eiusmod aliquip commodo ex.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  //const _CustomAppBar({Key? key}) : super(key: key);

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
              'pelicula',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          background: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/imagenes/loading.gif'),
              image: NetworkImage(
                  'https://cdn2.excelsior.com.mx/media/styles/image800x600/public/pictures/2021/06/09/2592367.jpg')),
        ));
  }
}
