import 'package:flutter/material.dart';
import 'package:itunes/model/song.dart';
import 'package:itunes/services/playerController.dart';
import 'package:itunes/services/resource.dart';
import 'package:itunes/services/serviceLocator.dart';

class ITunes extends ChangeNotifier{

  List<Song> songList=<Song>[];
  bool tracksNotFound = false;
  Song currentTrack;

  fetchSongs(String str) async{
    String url = "https://itunes.apple.com/search?term=$str&media=music&entity=song&attribute=artistTerm";
    final response = await Resource.get(url);
    List results = response['results'];

    songList = results.map((e) => Song(e)).toList();
    tracksNotFound = songList.length==0;

    notifyListeners();
    SL<PlayerController>().notifyPlayer();
  }

  Song fetchNext(){
    int currentIndex = songList.indexOf(currentTrack);

    if(currentIndex==-1 || currentIndex==songList.length-1) return null;

    return songList[currentIndex+1];
  }

  Song fetchPrev(){
    int currentIndex = songList.indexOf(currentTrack);
    if(currentIndex==-1 || currentIndex==0) return null;

    return songList[currentIndex-1];
  }

}