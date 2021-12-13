import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:sax_music_editor/modules/editor/models/sax_note.dart';

class Song {
  String title;
  List<SaxNote> partiture;
  Song({
    required this.title,
    required this.partiture,
  });

  Song copyWith({
    String? title,
    List<SaxNote>? partiture,
  }) {
    return Song(
      title: title ?? this.title,
      partiture: partiture ?? this.partiture,
    );
  }

  factory Song.newSong() => Song(title: "Nueva Canción", partiture: []);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'partiture': partiture.map((x) => x.toMap()).toList(),
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'] ?? '',
      partiture:
          List<SaxNote>.from(map['partiture']?.map((x) => SaxNote.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));

  @override
  String toString() => 'Song(title: $title, partiture: $partiture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song &&
        other.title == title &&
        listEquals(other.partiture, partiture);
  }

  @override
  int get hashCode => title.hashCode ^ partiture.hashCode;
}
