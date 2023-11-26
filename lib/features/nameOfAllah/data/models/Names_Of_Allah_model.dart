// ignore_for_file: file_names

class NamesOfAllahModel {
  String? name, text;

  NamesOfAllahModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    text = json["text"];
  }
}
