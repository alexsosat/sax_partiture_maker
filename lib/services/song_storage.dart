import 'package:get_storage/get_storage.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';

class Storage {
  GetStorage getStorage = GetStorage();

  List<Song> get storedSongs {
    List<Song> returnable = [];
    final List<dynamic> songsMap = getStorage.read(StorageRoutes.songsRoute);

    for (String element in songsMap) {
      returnable.add(Song.fromJson(element));
    }

    return returnable;
  }

  bool songExists(Song newSong) {
    List<Song> songs = storedSongs;
    int index = songs.indexWhere((song) => song.title == newSong.title);

    return index != -1;
  }

  Future<bool> writeSong(Song newSong) async {
    try {
      List<Song> songs = storedSongs;

      List<String> songsJsons = songs.map((e) => e.toJson()).toList();

      if (songsJsons.isEmpty) {
        songsJsons = [newSong.toJson()];
      } else {
        songsJsons.add(newSong.toJson());
      }

      await getStorage.write(StorageRoutes.songsRoute, songsJsons);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> overwriteSong(Song newSong) async {
    try {
      List<Song> songs = storedSongs;
      int index = songs.indexWhere((song) => song.title == newSong.title);

      songs[index] = newSong;

      List songsStrings = songs.map((e) => e.toJson()).toList();

      await getStorage.write(StorageRoutes.songsRoute, songsStrings);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSong(int index) async {
    try {
      List<Song> songs = storedSongs;
      songs.removeAt(index);

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
