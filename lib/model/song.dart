
import 'package:flutter/material.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/playerController.dart';
import 'package:itunes/services/serviceLocator.dart';

class Song extends ChangeNotifier{
  String trackUrl;//previewUrl
  String artworkUrl;//artworkUrl60
  String trackName;
  String artistName;
  String collectionName;
  bool isPlaying=false;

  Song(Map json):
        trackUrl = json['previewUrl'],
        artworkUrl = json['artworkUrl60'],
        trackName = json['trackName'],
        artistName = json['artistName'],
        collectionName = json['collectionName'];


  play(){
    final playerController = SL<PlayerController>();
    final itunes = SL<ITunes>();
    playerController.setTrack(trackUrl);
    itunes.currentTrack = this;
    notifyListeners();
  }

}