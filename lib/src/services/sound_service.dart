import 'package:audioplayers/audioplayers.dart';
import 'package:rxdart/rxdart.dart';

class SoundService {
  late BehaviorSubject<bool> _enableSound$;
  BehaviorSubject<bool> get enableSound$ => _enableSound$;
  late AudioPlayer _fixedPlayer;
  late AudioCache _player;

  SoundService() {
    _enableSound$ = BehaviorSubject<bool>.seeded(true);
    _fixedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    _player = AudioCache(fixedPlayer: _fixedPlayer);
    _player.loadAll(['x.mp3', 'o.mp3', 'click.mp3']);
  }

  playSound(String sound) {
    bool isSoundEnabled = _enableSound$.value;
    if (isSoundEnabled) {
      _player.play('$sound.mp3', volume: 0.6); // 0.0 -> 1.0
      // _fixedPlayer.setVolume(0.8);
    }
  }
}
