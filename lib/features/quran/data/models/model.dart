// ignore_for_file: non_constant_identifier_names

class NameModel {
  int? id, total_verses;
  String? name, transliteration;
  String? type;

  NameModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    total_verses = json["total_verses"];
    name = json["name"];
    type = json["type"];
    transliteration = json["transliteration"];
  }
}
