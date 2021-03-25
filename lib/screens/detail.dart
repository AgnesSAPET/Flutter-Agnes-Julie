import 'package:validationdwm14/models/movie.dart';
import 'package:validationdwm14/constants/firebase.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text('Detail Film'),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: getDetailMovie(args.title),
              builder: (context, snapshot) {
                List infoMovie = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(infoMovie[0].poster))),
                      ),
                      Text(infoMovie[0].title.toString()),
                      Text(infoMovie[0].year.toString()),
                      Text(infoMovie[0].kind.toString()),
                      Text(infoMovie[0].plot.toString()),
                      Text(infoMovie[0].runtime.toString()),
                      Text(infoMovie[0].actors.toString()),
                    ],
                  ),
                );
              }),
        ));
  }
}
