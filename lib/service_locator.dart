import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/src/services/sound_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Services
  locator.registerLazySingleton<SoundService>(() => SoundService());
}
