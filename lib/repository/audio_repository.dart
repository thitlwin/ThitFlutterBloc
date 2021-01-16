import 'package:thit_flutter_bloc/data/model/audio.dart';
import 'package:thit_flutter_bloc/provider/audio_provider.dart';

class AudioRepository {
  final AudioProvider _audioProvider = AudioProvider();

  AudioRepository();

  Future addAudio(Audio audio) {
    return _audioProvider.addNewAudio(audio);
  }

  Stream<List<Audio>> getAudioList() {
    return _audioProvider.audios();
  }
}
