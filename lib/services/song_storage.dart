import 'package:get_storage/get_storage.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';

class Storage {
  GetStorage getStorage = GetStorage();

  List<Song> get storedSongs {
    List<Song> returnable = [];
    final List<dynamic> songsMap = getStorage.read(StorageRoutes.songsRoute);

    for (var element in songsMap) {
      returnable.add(Song.fromJson(element));
    }

    return returnable;
  }

  Future<bool> writeSong(Song newSong) async {
    try {
      List<Song>? songs = storedSongs;
      if (songs.isEmpty) {
        songs = [newSong];
      } else {
        songs.add(newSong);
      }

      await getStorage.write(StorageRoutes.songsRoute, songs);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class StorageRoutes {
  static const songsRoute = "storedSongs";
}
