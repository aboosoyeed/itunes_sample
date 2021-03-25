
import 'package:flutter/material.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/playerController.dart';
import 'package:itunes/services/serviceLocator.dart';

class Song extends ChangeNotifier{

  final String trackUrl;
  final String artworkUrl;
  final String trackName;
  final String artistName;
  final String collectionName;

  Song(Map json):
        trackUrl = json['previewUrl'],
        artworkUrl = json['artworkUrl60'],
        trackName = json['trackName'],
        artistName = json['artistName'],
        collectionName = json['collectionName'];


  /*
  * Play the song and notify all the listeners
  * notifies: SongTileWidget
  * */
  play(){
    final playerController = SL<PlayerController>();
    final itunes = SL<ITunes>();
    playerController.setTrack(trackUrl);
    itunes.currentTrack = this;
    notifyListeners();
  }

}