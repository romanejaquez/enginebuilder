import 'package:assets_audio_player/assets_audio_player.dart';

class AudioService {

  final engineAudio = AssetsAudioPlayer();
  final whistleAudio = AssetsAudioPlayer();

  void playWhistleAudio(String whistle) {
    whistleAudio.open(Audio('./assets/sounds/whistles/$whistle.mp3'));
  }

  void playEngineAudio() {

    if (engineAudio.isPlaying.hasValue && !engineAudio.isPlaying.valueOrNull!) {
      engineAudio.open(
        Audio('./assets/sounds/steamengine.mp3'),
        volume: 0.2,
        loopMode: LoopMode.single
      );
    }
  }

  void toggleSound() {
    whistleAudio.playOrPause();
    engineAudio.playOrPause();
  }

}