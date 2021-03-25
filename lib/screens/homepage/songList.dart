
import 'package:flutter/material.dart';
import 'package:itunes/screens/homepage/songTile.dart';
import 'package:provider/provider.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/serviceLocator.dart';


class SongListWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final itunes = SL<ITunes>();

    return Expanded(
      child: ChangeNotifierProvider.value(
        value: itunes,
        child: Consumer<ITunes>(builder: (context, _, child) {
          return Container(
            child: itunes.songList.length>0?
            ListView(
              children: itunes.songList.map((song) => SongTileWidget(song)).toList(),
            ):
            Center(
              child: itunes.tracksNotFound?
                Text("No Artist Found",style: TextStyle(color: Colors.redAccent),):
                Text("Search Artist"),
            ),
          );
        }),
      ),
    );
  }
}