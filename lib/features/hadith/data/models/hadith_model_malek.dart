class HadithModelFinal {
  int? id;
  HadithModelData? data;
  HadithModelFinal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    data = json["data"] != null ? HadithModelData.fromJson(json["data"]) : null;
  }
}

class HadithModelData {
  MetaDataModel? metadata;
  List<HadithsModel> hadiths = [];
  HadithModelData.fromJson(Map<String, dynamic> json) {
    metadata = json["metadata"] != null
        ? MetaDataModel.fromJson(json['metadata'])
        : null;
    json['hadiths'].forEach((element) {
      hadiths.add(HadithsModel.fromJson(element));
    });
  }
}

class MetaDataModel {
  String? name;
  SectionModel? section;
  MetaDataModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    section =
        json["section"] != null ? SectionModel.fromJson(json["section"]) : null;
  }
}

class SectionModel {
  String? name;
  SectionModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}

class HadithsModel {
  int? hadithnumber, arabicnumber;
  String? text;

  HadithsModel.fromJson(Map<String, dynamic> json) {
    hadithnumber = json["hadithnumber"];
    arabicnumber = json["arabicnumber"];
    text = json["text"];
  }
}
