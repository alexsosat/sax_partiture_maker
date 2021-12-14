import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';

class SongStorageService {
  // Makes this a singleton class, as we want only want a single
  // instance of this object for the whole application
  SongStorageService._privateConstructor();
  static final SongStorageService instance =
      SongStorageService._privateConstructor();

  static File? _file;

  static const _fileName = 'app_data.txt';

  static List<Song> _storedSongs = [];

  // Get the data file
  Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    _storedSongs = await getSongs();
    return _file!;
  }

  // Inititalize file
  Future<File> _initFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    final _path = _directory.path;
    final _fileTemp = File('$_path/SaxMusicMaker/data/$_fileName');
    _fileTemp.createSync(recursive: true);
    return _fileTemp;
  }

  Future<List<Song>> getSongs() async {
    final File fl = await file;
    final _content = await fl.readAsString();

    if (_content.isEmpty) return [];

    final List<dynamic> _jsonData = jsonDecode(_content);
    final List<Song> _users = _jsonData
        .map(
          (e) => Song.fromJson(e),
        )
        .toList();
    return _users;
  }

  bool songExists(Song newSong) =>
      _storedSongs.indexWhere((song) => song.title == newSong.title) != -1;

  Future<bool> writeSong(Song newSong) async {
    final File fl = await file;
    try {
      if (_storedSongs.isEmpty) {
        _storedSongs = [newSong];
      } else {
        _storedSongs.add(newSong);
      }
      final _userListMap = _storedSongs.map((e) => e.toJson()).toList();

      await fl.writeAsString(jsonEncode(_userListMap));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> overwriteSong(Song newSong) async {
    final File fl = await file;
    try {
      int index =
          _storedSongs.indexWhere((song) => song.title == newSong.title);

      _storedSongs[index] = newSong;

      final _userListMap = _storedSongs.map((e) => e.toJson()).toList();

      await fl.writeAsString(jsonEncode(_userListMap));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSong(int index) async {
    final File fl = await file;
    try {
      _storedSongs.removeAt(index);

      final _userListMap = _storedSongs.map((e) => e.toJson()).toList();

      await fl.writeAsString(jsonEncode(_userListMap));
      return true;
    } catch (e) {
      return false;
    }
  }
}
