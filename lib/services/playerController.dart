import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends ChangeNotifier{
  VideoPlayerController controller;

  PlayerController();

  setTrack(trackUrl) async{

    controller = VideoPlayerController.network(trackUrl);
    notifyListeners();
    await controller.initialize();

    play();
    controller.addListener(() {
      if(!controller.value.isPlaying && (controller.value.duration==controller.value.position)){
        notifyListeners();
      }
    });
  }

  pause(){
    controller.pause();
    notifyListeners();
  }

  play(){

    if((controller.value.duration==controller.value.position)){
      controller.seekTo(Duration(seconds: 0));
    }
    controller.play();
    notifyListeners();
  }

  notifyPlayer() {
    notifyListeners();
  }

}