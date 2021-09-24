import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  //const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
        ],
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
    );
  }
}
