class AzkarModel {
  int? id;
  String? category;

  List<ArrayAzkarModel> array = [];

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    category = json["category"];
    json["array"].forEach((element) {
      array.add(ArrayAzkarModel.fromJson(element));
    });
  }
}

class ArrayAzkarModel {
  int? id, count;
  String? text;

  ArrayAzkarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    count = json["count"];
    text = json["text"];
  }
}
