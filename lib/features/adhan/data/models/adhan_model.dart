class AdhanModel {
  String? status;
  List<DataModel> data = [];
  AdhanModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((dataModel) => dataModel.toJson()).toList(),
    };
  }

}

class DataModel {
  TimingsModel? timings;
  DateModel? date;
  MetaModel? meta;
  DataModel.fromJson(Map<String, dynamic> json) {
    timings =
        json["timings"] != null ? TimingsModel.fromJson(json['timings']) : null;
    date = json["date"] != null ? DateModel.fromJson(json['date']) : null;
    meta = json["meta"] != null ? MetaModel.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'timings': timings?.toJson(),
      'date': date?.toJson(),
      'meta': meta?.toJson(),
    };
  }
}

class TimingsModel {
  String? fajr,
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
  TimingsModel.fromJson(Map<String, dynamic> json) {
    fajr = json["Fajr"];
    sunrise = json["Sunrise"];
    dhuhr = json["Dhuhr"];
    asr = json["Asr"];
    sunset = json["Sunset"];
    maghrib = json["Maghrib"];
    isha = json["Isha"];
    imsak = json["Imsak"];
    midnight = json["Midnight"];
    firstthird = json["Firstthird"];
    lastthird = json["Lastthird"];
  }

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
}

class DateModel {
  String? readable;
  HijriModel? hijri;
  GregorianModel? gregorian;
  DateModel.fromJson(Map<String, dynamic> json) {
    readable = json["readable"];
    hijri = json["hijri"] != null ? HijriModel.fromJson(json['hijri']) : null;
    gregorian = json["gregorian"] != null ? GregorianModel.fromJson(json['gregorian']) : null;
  }
    Map<String, dynamic> toJson() => {
        'readable': readable,
        'hijri': hijri?.toJson(),
        'gregorian': gregorian?.toJson(),
      };
}

class GregorianModel {
  String? date;

  GregorianModel.fromJson(Map<String, dynamic> json) {
    date = json["date"];
  }
    Map<String, dynamic> toJson() => {
        'date': date,
      };
}

class HijriModel {
  String? date;
  WeekdayModel? weekday;
  HijriModel.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    weekday =
        json["weekday"] != null ? WeekdayModel.fromJson(json['weekday']) : null;
  }
    Map<String, dynamic> toJson() => {
        'date': date,
        'weekday': weekday?.toJson(),
      };
}

class WeekdayModel {
  String? ar;
  WeekdayModel.fromJson(Map<String, dynamic> json) {
    ar = json["ar"];
  }
    Map<String, dynamic> toJson() => {
        'ar': ar,
      };
}

class MetaModel {
  String? timezone;
  MetaModel.fromJson(Map<String, dynamic> json) {
    timezone = json["timezone"];
  }
    Map<String, dynamic> toJson() => {
        'timezone': timezone,
      };
}
