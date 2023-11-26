// ignore_for_file: non_constant_identifier_names

class AyahModel {
  int? id, total_verses;
  String? name, transliteration, type, translation;

  List<VersesModel> verses = [];

  AyahModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    total_verses = json["total_verses"];
    name = json["name"];
    transliteration = json["transliteration"];
    type = json["type"];
    translation = json["translation"];
    json["verses"].forEach((element) {
      verses.add(VersesModel.fromJson(element));
    });
  }
}

class VersesModel {
  int? id;
  String? text, translation;
  VersesModel({this.id, this.text, this.translation});

  VersesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    text = json["text"];
    translation = json["translation"];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "translation": translation,
    };
  }
}
