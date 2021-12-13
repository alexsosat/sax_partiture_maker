import 'dart:convert';

class SaxNote {
  final int id;
  final String name;
  final String imgUrl;

  SaxNote({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory SaxNote.fromMap(Map<String, dynamic> map) {
    return SaxNote(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SaxNote.fromJson(String source) =>
      SaxNote.fromMap(json.decode(source));
}
