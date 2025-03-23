
class AdhanModel {
  String? status;
  List<DataModel> data = [];

  AdhanModel.fromJson(Map<String, dynamic> json) {
    status = json["status"] ?? "unknown";
    if (json['data'] != null && json['data'] is List) {
      json['data'].forEach((element) {
        data.add(DataModel.fromJson(element));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((dataModel) => dataModel.toJson()).toList(),
    };
  }
}

class DataModel {
  TimingsModel timings;
  DateModel date;
  MetaModel meta;

  DataModel.fromJson(Map<String, dynamic> json)
    : timings =
          json["timings"] != null
              ? TimingsModel.fromJson(json['timings'])
              : TimingsModel.defaultInstance(),
      date =
          json["date"] != null
              ? DateModel.fromJson(json['date'])
              : DateModel.defaultInstance(),
      meta =
          json["meta"] != null
              ? MetaModel.fromJson(json['meta'])
              : MetaModel.defaultInstance();

  Map<String, dynamic> toJson() {
    return {
      'timings': timings.toJson(),
      'date': date.toJson(),
      'meta': meta.toJson(),
    };
  }
}

class TimingsModel {
  String fajr,
      sunrise,
      dhuhr,
      asr,
      sunset,
      maghrib,
      isha,
      imsak,
      midnight,
      firstthird,
      lastthird;

  TimingsModel.fromJson(Map<String, dynamic> json)
    : fajr = json["Fajr"] ?? "00:00",
      sunrise = json["Sunrise"] ?? "00:00",
      dhuhr = json["Dhuhr"] ?? "00:00",
      asr = json["Asr"] ?? "00:00",
      sunset = json["Sunset"] ?? "00:00",
      maghrib = json["Maghrib"] ?? "00:00",
      isha = json["Isha"] ?? "00:00",
      imsak = json["Imsak"] ?? "00:00",
      midnight = json["Midnight"] ?? "00:00",
      firstthird = json["Firstthird"] ?? "00:00",
      lastthird = json["Lastthird"] ?? "00:00";

  Map<String, dynamic> toJson() => {
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Sunset': sunset,
    'Maghrib': maghrib,
    'Isha': isha,
    'Imsak': imsak,
    'Midnight': midnight,
    'Firstthird': firstthird,
    'Lastthird': lastthird,
  };

  static TimingsModel defaultInstance() {
    return TimingsModel.fromJson({});
  }
}

class DateModel {
  String readable;
  HijriModel hijri;
  GregorianModel gregorian;

  DateModel.fromJson(Map<String, dynamic> json)
    : readable = json["readable"] ?? "unknown",
      hijri =
          json["hijri"] != null
              ? HijriModel.fromJson(json['hijri'])
              : HijriModel.defaultInstance(),
      gregorian =
          json["gregorian"] != null
              ? GregorianModel.fromJson(json['gregorian'])
              : GregorianModel.defaultInstance();

  Map<String, dynamic> toJson() => {
    'readable': readable,
    'hijri': hijri.toJson(),
    'gregorian': gregorian.toJson(),
  };

  static DateModel defaultInstance() {
    return DateModel.fromJson({});
  }
}

class GregorianModel {
  String date;
  GregorianModel.fromJson(Map<String, dynamic> json)
    : date = json["date"] ?? "unknown";

  Map<String, dynamic> toJson() => {'date': date};

  static GregorianModel defaultInstance() {
    return GregorianModel.fromJson({});
  }
}

class HijriModel {
  String date;
  WeekdayModel weekday;

  HijriModel.fromJson(Map<String, dynamic> json)
    : date = json["date"] ?? "unknown",
      weekday =
          json["weekday"] != null
              ? WeekdayModel.fromJson(json['weekday'])
              : WeekdayModel.defaultInstance();

  Map<String, dynamic> toJson() => {'date': date, 'weekday': weekday.toJson()};

  static HijriModel defaultInstance() {
    return HijriModel.fromJson({});
  }
}

class WeekdayModel {
  String ar;
  WeekdayModel.fromJson(Map<String, dynamic> json)
    : ar = json["ar"] ?? "unknown";

  Map<String, dynamic> toJson() => {'ar': ar};

  static WeekdayModel defaultInstance() {
    return WeekdayModel.fromJson({});
  }
}

class MetaModel {
  String timezone;
  MetaModel.fromJson(Map<String, dynamic> json)
    : timezone = json["timezone"] ?? "UTC";

  Map<String, dynamic> toJson() => {'timezone': timezone};

  static MetaModel defaultInstance() {
    return MetaModel.fromJson({});
  }
}
