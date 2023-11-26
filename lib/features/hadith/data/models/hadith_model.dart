class HadithModel {
  int? number;
  String? searchTerm, description, hadith;

  HadithModel.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    searchTerm = json["searchTerm"];
    description = json["description"];
    hadith = json["hadith"];
  }
}
