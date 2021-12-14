import 'dart:convert';

class SaxNote {
  final String name;
  final String imgUrl;

  SaxNote({
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory SaxNote.fromMap(Map<String, dynamic> map) {
    return SaxNote(
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SaxNote.fromJson(String source) =>
      SaxNote.fromMap(json.decode(source));
}
