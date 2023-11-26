
class QuranAudioModel {
  String? status;

  DataModel? data;

  QuranAudioModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] != null ? DataModel.fromJson(json["data"]) : null;
  }
}

class DataModel {
  List<SurahsData> surahs = [];
  DataModel.fromJson(Map<String, dynamic> json) {
    json["surahs"].forEach((element) {
      surahs.add(SurahsData.fromJson(element));
    });
  }
}

class SurahsData {
  int? number;
  String? name, englishName;

  List<AyahsData> ayahs = [];

  SurahsData.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    json['ayahs'].forEach((element) {
      ayahs.add(AyahsData.fromJson(element));
    });
  }
}

class AyahsData {
  int? number;
  String? audio, text;

  AyahsData.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    audio = json["audio"];
    text = json["text"];
  }
}
