import 'package:get_it/get_it.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/playerController.dart';

GetIt SL = GetIt.instance;

void setUpServiceLocator() {
  GetIt.I.registerSingleton<ITunes>(ITunes());
  GetIt.I.registerSingleton<PlayerController>(PlayerController());
}