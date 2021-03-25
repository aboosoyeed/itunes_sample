import 'package:flutter/material.dart';
import 'package:itunes/model/song.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/serviceLocator.dart';
import 'package:provider/provider.dart';

class SongTileWidget extends StatelessWidget{
  final Song song;
  final ITunes itunes = SL<ITunes>();
  SongTileWidget(this.song);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: song,
      child: Consumer<Song>(
        builder: (context, _, child){
          return ListTile(
            onTap: (){
              song.play();
            },
            title: Text(song.trackName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(song.artistName),
                Text(song.collectionName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)
              ]
            ),
            leading: Container(
              width: 60,
              height: 60,
              child: song.artworkUrl!=null?Image.network(song.artworkUrl):null,
            ),
            trailing: itunes.currentTrack==song ? Icon(Icons.graphic_eq):null,
            isThreeLine: true,
          );
        }
      ),
    );
  }
}