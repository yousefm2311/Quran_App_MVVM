// ignore_for_file: file_names

class TafaseerModel {
  int? id;
  List<DataModel> data = [];

  TafaseerModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    json["data"].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int? id, sura, aya;
  String? text;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sura = json['sura'];
    aya = json['aya'];
    text = json['text'];
  }
}
