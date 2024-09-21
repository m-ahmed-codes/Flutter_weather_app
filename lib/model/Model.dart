// class Root {
//   Location? location;
//   Current? current;
//   Forecast? forecast;

//   Root({ this.location,  this.current,  this.forecast});

//   factory Root.fromJson(Map<String, dynamic> json) => Root(
//         location: Location.fromJson(json["location"]),
//         current: Current.fromJson(json["current"]),
//         forecast: Forecast.fromJson(json["forecast"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "location": location?.toJson(),
//         "current": current?.toJson(),
//         "forecast": forecast?.toJson(),
//       };
// }

// class Location {
//   String name;
//   String region;
//   String country;
//   num lat;
//   num lon;
//   String tzId;
//   num localtimeEpoch;
//   String localtime;

//   Location({
//     required this.name,
//     required this.region,
//     required this.country,
//     required this.lat,
//     required this.lon,
//     required this.tzId,
//     required this.localtimeEpoch,
//     required this.localtime,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         name: json["name"],
//         region: json["region"],
//         country: json["country"],
//         lat: json["lat"].tonum(),
//         lon: json["lon"].tonum(),
//         tzId: json["tz_id"],
//         localtimeEpoch: json["localtime_epoch"],
//         localtime: json["localtime"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "region": region,
//         "country": country,
//         "lat": lat,
//         "lon": lon,
//         "tz_id": tzId,
//         "localtime_epoch": localtimeEpoch,
//         "localtime": localtime,
//       };
// }

// class Current {
//   num lastUpdatedEpoch;
//   String lastUpdated;
//   num tempC;
//   num tempF;
//   num isDay;
//   Condition condition;
//   num windMph;
//   num windKph;
//   num windDegree;
//   String windDir;
//   num pressureMb;
//   num pressureIn;
//   num precipMm;
//   num precipIn;
//   num humidity;
//   num cloud;
//   num feelslikeC;
//   num feelslikeF;
//   num visKm;
//   num visMiles;
//   num uv;
//   num gustMph;
//   num gustKph;

//   Current({
//     required this.lastUpdatedEpoch,
//     required this.lastUpdated,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.visKm,
//     required this.visMiles,
//     required this.uv,
//     required this.gustMph,
//     required this.gustKph,
//   });

//   factory Current.fromJson(Map<String, dynamic> json) => Current(
//         lastUpdatedEpoch: json["last_updated_epoch"],
//         lastUpdated: json["last_updated"],
//         tempC: json["temp_c"].tonum(),
//         tempF: json["temp_f"].tonum(),
//         isDay: json["is_day"],
//         condition: Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"].tonum(),
//         windKph: json["wind_kph"].tonum(),
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"].tonum(),
//         precipMm: json["precip_mm"].tonum(),
//         precipIn: json["precip_in"].tonum(),
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"].tonum(),
//         feelslikeF: json["feelslike_f"].tonum(),
//         visKm: json["vis_km"].tonum(),
//         visMiles: json["vis_miles"].tonum(),
//         uv: json["uv"],
//         gustMph: json["gust_mph"].tonum(),
//         gustKph: json["gust_kph"].tonum(),
//       );

//   Map<String, dynamic> toJson() => {
//         "last_updated_epoch": lastUpdatedEpoch,
//         "last_updated": lastUpdated,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "uv": uv,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//       };
// }

// class Condition {
//   String text;
//   String icon;
//   num code;

//   Condition({
//     required this.text,
//     required this.icon,
//     required this.code,
//   });

//   factory Condition.fromJson(Map<String, dynamic> json) => Condition(
//         text: json["text"],
//         icon: json["icon"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "text": text,
//         "icon": icon,
//         "code": code,
//       };
// }

// class Forecast {
//   List<Forecastday> forecastday;

//   Forecast({
//     required this.forecastday,
//   });

//   factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
//         forecastday: (json["forecastday"] as List)
//             .map((dayJson) => Forecastday.fromJson(dayJson))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         "forecastday": forecastday?.map((day) => day.toJson()).toList(),
//       };
// }


// class Forecastday {
//   String date;
//   num dateEpoch;
//   Day day;
//   Astro astro;
//   List<Hour> hour;

//   Forecastday({
//     required this.date,
//     required this.dateEpoch,
//     required this.day,
//     required this.astro,
//     required this.hour,
//   });

//   factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
//         date: json["date"],
//         dateEpoch: json["date_epoch"],
//         day: Day.fromJson(json["day"]),
//         astro: Astro.fromJson(json["astro"]),
//         hour: (json["hour"] as List)
//             .map((hourJson) => Hour.fromJson(hourJson))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         "date": date,
//         "date_epoch": dateEpoch,
//         "day": day?.toJson(),
//         "astro": astro?.toJson(),
//         "hour": hour?.map((hour) => hour.toJson()).toList(),
//       };
// }

// class Day {
//   num maxtempC;
//   num maxtempF;
//   num mnumempC;
//   num mnumempF;
//   num avgtempC;
//   num avgtempF;
//   num maxwindMph;
//   num maxwindKph;
//   num totalprecipMm;
//   num totalprecipIn;
//   num totalsnowCm;
//   num avgvisKm;
//   num avgvisMiles;
//   num avghumidity;
//   num dailyWillItRain;
//   num dailyChanceOfRain;
//   num dailyWillItSnow;
//   num dailyChanceOfSnow;
//   Condition condition;
//   num uv;

//   Day({
//     required this.maxtempC,
//     required this.maxtempF,
//     required this.mnumempC,
//     required this.mnumempF,
//     required this.avgtempC,
//     required this.avgtempF,
//     required this.maxwindMph,
//     required this.maxwindKph,
//     required this.totalprecipMm,
//     required this.totalprecipIn,
//     required this.totalsnowCm,
//     required this.avgvisKm,
//     required this.avgvisMiles,
//     required this.avghumidity,
//     required this.dailyWillItRain,
//     required this.dailyChanceOfRain,
//     required this.dailyWillItSnow,
//     required this.dailyChanceOfSnow,
//     required this.condition,
//     required this.uv,
//   });

//   factory Day.fromJson(Map<String, dynamic> json) => Day(
//         maxtempC: json["maxtemp_c"].tonum(),
//         maxtempF: json["maxtemp_f"].tonum(),
//         mnumempC: json["mnumemp_c"].tonum(),
//         mnumempF: json["mnumemp_f"].tonum(),
//         avgtempC: json["avgtemp_c"].tonum(),
//         avgtempF: json["avgtemp_f"].tonum(),
//         maxwindMph: json["maxwind_mph"].tonum(),
//         maxwindKph: json["maxwind_kph"].tonum(),
//         totalprecipMm: json["totalprecip_mm"].tonum(),
//         totalprecipIn: json["totalprecip_in"].tonum(),
//         totalsnowCm: json["totalsnow_cm"].tonum(),
//         avgvisKm: json["avgvis_km"].tonum(),
//         avgvisMiles: json["avgvis_miles"].tonum(),
//         avghumidity: json["avghumidity"],
//         dailyWillItRain: json["daily_will_it_rain"],
//         dailyChanceOfRain: json["daily_chance_of_rain"],
//         dailyWillItSnow: json["daily_will_it_snow"],
//         dailyChanceOfSnow: json["daily_chance_of_snow"],
//         condition: Condition.fromJson(json["condition"]),
//         uv: json["uv"],
//       );

//   Map<String, dynamic> toJson() => {
//         "maxtemp_c": maxtempC,
//         "maxtemp_f": maxtempF,
//         "mnumemp_c": mnumempC,
//         "mnumemp_f": mnumempF,
//         "avgtemp_c": avgtempC,
//         "avgtemp_f": avgtempF,
//         "maxwind_mph": maxwindMph,
//         "maxwind_kph": maxwindKph,
//         "totalprecip_mm": totalprecipMm,
//         "totalprecip_in": totalprecipIn,
//         "totalsnow_cm": totalsnowCm,
//         "avgvis_km": avgvisKm,
//         "avgvis_miles": avgvisMiles,
//         "avghumidity": avghumidity,
//         "daily_will_it_rain": dailyWillItRain,
//         "daily_chance_of_rain": dailyChanceOfRain,
//         "daily_will_it_snow": dailyWillItSnow,
//         "daily_chance_of_snow": dailyChanceOfSnow,
//         "condition": condition?.toJson(),
//         "uv": uv,
//       };
// }

// class Astro {
//   String sunrise;
//   String sunset;
//   String moonrise;
//   String moonset;
//   String moonPhase;
//   num moonIllumination;
//   num isMoonUp;
//   num isSunUp;

//   Astro({
//     required this.sunrise,
//     required this.sunset,
//     required this.moonrise,
//     required this.moonset,
//     required this.moonPhase,
//     required this.moonIllumination,
//     required this.isMoonUp,
//     required this.isSunUp,
//   });

//   factory Astro.fromJson(Map<String, dynamic> json) => Astro(
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//         moonrise: json["moonrise"],
//         moonset: json["moonset"],
//         moonPhase: json["moon_phase"],
//         moonIllumination: json["moon_illumination"],
//         isMoonUp: json["is_moon_up"],
//         isSunUp: json["is_sun_up"],
//       );

//   Map<String, dynamic> toJson() => {
//         "sunrise": sunrise,
//         "sunset": sunset,
//         "moonrise": moonrise,
//         "moonset": moonset,
//         "moon_phase": moonPhase,
//         "moon_illumination": moonIllumination,
//         "is_moon_up": isMoonUp,
//         "is_sun_up": isSunUp,
//       };
// }

// class Hour {
//   num timeEpoch;
//   String time;
//   num tempC;
//   num tempF;
//   num isDay;
//   Condition condition;
//   num windMph;
//   num windKph;
//   num windDegree;
//   String windDir;
//   num pressureMb;
//   num pressureIn;
//   num precipMm;
//   num precipIn;
//   num snowCm;
//   num humidity;
//   num cloud;
//   num feelslikeC;
//   num feelslikeF;
//   num windchillC;
//   num windchillF;
//   num heatindexC;
//   num heatindexF;
//   num dewponumC;
//   num dewponumF;
//   num willItRain;
//   num chanceOfRain;
//   num willItSnow;
//   num chanceOfSnow;
//   num visKm;
//   num visMiles;
//   num gustMph;
//   num gustKph;
//   num uv;

//   Hour({
//     required this.timeEpoch,
//     required this.time,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.snowCm,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.windchillC,
//     required this.windchillF,
//     required this.heatindexC,
//     required this.heatindexF,
//     required this.dewponumC,
//     required this.dewponumF,
//     required this.willItRain,
//     required this.chanceOfRain,
//     required this.willItSnow,
//     required this.chanceOfSnow,
//     required this.visKm,
//     required this.visMiles,
//     required this.gustMph,
//     required this.gustKph,
//     required this.uv,
//   });

//   factory Hour.fromJson(Map<String, dynamic> json) => Hour(
//         timeEpoch: json["time_epoch"],
//         time: json["time"],
//         tempC: json["temp_c"].tonum(),
//         tempF: json["temp_f"].tonum(),
//         isDay: json["is_day"],
//         condition: Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"].tonum(),
//         windKph: json["wind_kph"].tonum(),
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"].tonum(),
//         precipMm: json["precip_mm"].tonum(),
//         precipIn: json["precip_in"].tonum(),
//         snowCm: json["snow_cm"].tonum(),
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"].tonum(),
//         feelslikeF: json["feelslike_f"].tonum(),
//         windchillC: json["windchill_c"].tonum(),
//         windchillF: json["windchill_f"].tonum(),
//         heatindexC: json["heatindex_c"].tonum(),
//         heatindexF: json["heatindex_f"].tonum(),
//         dewponumC: json["dewponum_c"].tonum(),
//         dewponumF: json["dewponum_f"].tonum(),
//         willItRain: json["will_it_rain"],
//         chanceOfRain: json["chance_of_rain"],
//         willItSnow: json["will_it_snow"],
//         chanceOfSnow: json["chance_of_snow"],
//         visKm: json["vis_km"].tonum(),
//         visMiles: json["vis_miles"].tonum(),
//         gustMph: json["gust_mph"].tonum(),
//         gustKph: json["gust_kph"].tonum(),
//         uv: json["uv"],
//       );

//   Map<String, dynamic> toJson() => {
//         "time_epoch": timeEpoch,
//         "time": time,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "snow_cm": snowCm,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "windchill_c": windchillC,
//         "windchill_f": windchillF,
//         "heatindex_c": heatindexC,
//         "heatindex_f": heatindexF,
//         "dewponum_c": dewponumC,
//         "dewponum_f": dewponumF,
//         "will_it_rain": willItRain,
//         "chance_of_rain": chanceOfRain,
//         "will_it_snow": willItSnow,
//         "chance_of_snow": chanceOfSnow,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//         "uv": uv,
//       };
// }





// *****************************************************************
class AirQuality {
  num? co;
  num? no2;
  num? o3;
  num? so2;
  num? pm25;
  num? pm10;
  num? usepaindex;
  num? gbdefraindex;

  AirQuality(
      {this.co,
      this.no2,
      this.o3,
      this.so2,
      this.pm25,
      this.pm10,
      this.usepaindex,
      this.gbdefraindex});

  AirQuality.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usepaindex = json['us-epa-index'];
    gbdefraindex = json['gb-defra-index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['co'] = co;
    data['no2'] = no2;
    data['o3'] = o3;
    data['so2'] = so2;
    data['pm2_5'] = pm25;
    data['pm10'] = pm10;
    data['us-epa-index'] = usepaindex;
    data['gb-defra-index'] = gbdefraindex;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonphase;
  int? moonillumination;
  num? ismoonup;
  num? issunup;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonphase,
      this.moonillumination,
      this.ismoonup,
      this.issunup});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonphase = json['moon_phase'];
    moonillumination = json['moon_illumination'];
    ismoonup = json['is_moon_up'];
    issunup = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonphase;
    data['moon_illumination'] = moonillumination;
    data['is_moon_up'] = ismoonup;
    data['is_sun_up'] = issunup;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  num? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Current {
  num? lastupdatedepoch;
  String? lastupdated;
  num? tempc;
  num? tempf;
  num? isday;
  Condition? condition;
  num? windmph;
  num? windkph;
  num? winddegree;
  String? winddir;
  num? pressuremb;
  num? pressurein;
  num? precipmm;
  num? precipin;
  num? humidity;
  num? cloud;
  num? feelslikec;
  num? feelslikef;
  num? viskm;
  num? vismiles;
  num? uv;
  num? gustmph;
  num? gustkph;
  AirQuality? airquality;

  Current(
      {this.lastupdatedepoch,
      this.lastupdated,
      this.tempc,
      this.tempf,
      this.isday,
      this.condition,
      this.windmph,
      this.windkph,
      this.winddegree,
      this.winddir,
      this.pressuremb,
      this.pressurein,
      this.precipmm,
      this.precipin,
      this.humidity,
      this.cloud,
      this.feelslikec,
      this.feelslikef,
      this.viskm,
      this.vismiles,
      this.uv,
      this.gustmph,
      this.gustkph,
      this.airquality});

  Current.fromJson(Map<String, dynamic> json) {
    lastupdatedepoch = json['last_updated_epoch'];
    lastupdated = json['last_updated'];
    tempc = json['temp_c'];
    tempf = json['temp_f'];
    isday = json['is_day'];
    condition = json['condition'] != null
        ? Condition?.fromJson(json['condition'])
        : null;
    windmph = json['wind_mph'];
    windkph = json['wind_kph'];
    winddegree = json['wind_degree'];
    winddir = json['wind_dir'];
    pressuremb = json['pressure_mb'];
    pressurein = json['pressure_in'];
    precipmm = json['precip_mm'];
    precipin = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikec = json['feelslike_c'];
    feelslikef = json['feelslike_f'];
    viskm = json['vis_km'];
    vismiles = json['vis_miles'];
    uv = json['uv'];
    gustmph = json['gust_mph'];
    gustkph = json['gust_kph'];
    airquality = json['air_quality'] != null
        ? AirQuality?.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['last_updated_epoch'] = lastupdatedepoch;
    data['last_updated'] = lastupdated;
    data['temp_c'] = tempc;
    data['temp_f'] = tempf;
    data['is_day'] = isday;
    data['condition'] = condition!.toJson();
    data['wind_mph'] = windmph;
    data['wind_kph'] = windkph;
    data['wind_degree'] = winddegree;
    data['wind_dir'] = winddir;
    data['pressure_mb'] = pressuremb;
    data['pressure_in'] = pressurein;
    data['precip_mm'] = precipmm;
    data['precip_in'] = precipin;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikec;
    data['feelslike_f'] = feelslikef;
    data['vis_km'] = viskm;
    data['vis_miles'] = vismiles;
    data['uv'] = uv;
    data['gust_mph'] = gustmph;
    data['gust_kph'] = gustkph;
    data['air_quality'] = airquality!.toJson();
    return data;
  }
}

class Day {
  num? maxtempc;
  num? maxtempf;
  num? mnumempc;
  num? mnumempf;
  num? avgtempc;
  num? avgtempf;
  num? maxwindmph;
  num? maxwindkph;
  num? totalprecipmm;
  num? totalprecipin;
  num? totalsnowcm;
  num? avgviskm;
  num? avgvismiles;
  num? avghumidity;
  num? dailywillitrain;
  num? dailychanceofrain;
  num? dailywillitsnow;
  num? dailychanceofsnow;
  Condition? condition;
  num? uv;
  AirQuality? airquality;

  Day(
      {this.maxtempc,
      this.maxtempf,
      this.mnumempc,
      this.mnumempf,
      this.avgtempc,
      this.avgtempf,
      this.maxwindmph,
      this.maxwindkph,
      this.totalprecipmm,
      this.totalprecipin,
      this.totalsnowcm,
      this.avgviskm,
      this.avgvismiles,
      this.avghumidity,
      this.dailywillitrain,
      this.dailychanceofrain,
      this.dailywillitsnow,
      this.dailychanceofsnow,
      this.condition,
      this.uv,
      this.airquality});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempc = json['maxtemp_c'];
    maxtempf = json['maxtemp_f'];
    mnumempc = json['mnumemp_c'];
    mnumempf = json['mnumemp_f'];
    avgtempc = json['avgtemp_c'];
    avgtempf = json['avgtemp_f'];
    maxwindmph = json['maxwind_mph'];
    maxwindkph = json['maxwind_kph'];
    totalprecipmm = json['totalprecip_mm'];
    totalprecipin = json['totalprecip_in'];
    totalsnowcm = json['totalsnow_cm'];
    avgviskm = json['avgvis_km'];
    avgvismiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailywillitrain = json['daily_will_it_rain'];
    dailychanceofrain = json['daily_chance_of_rain'];
    dailywillitsnow = json['daily_will_it_snow'];
    dailychanceofsnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition?.fromJson(json['condition'])
        : null;
    uv = json['uv'];
    airquality = json['air_quality'] != null
        ? AirQuality?.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['maxtemp_c'] = maxtempc;
    data['maxtemp_f'] = maxtempf;
    data['mnumemp_c'] = mnumempc;
    data['mnumemp_f'] = mnumempf;
    data['avgtemp_c'] = avgtempc;
    data['avgtemp_f'] = avgtempf;
    data['maxwind_mph'] = maxwindmph;
    data['maxwind_kph'] = maxwindkph;
    data['totalprecip_mm'] = totalprecipmm;
    data['totalprecip_in'] = totalprecipin;
    data['totalsnow_cm'] = totalsnowcm;
    data['avgvis_km'] = avgviskm;
    data['avgvis_miles'] = avgvismiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailywillitrain;
    data['daily_chance_of_rain'] = dailychanceofrain;
    data['daily_will_it_snow'] = dailywillitsnow;
    data['daily_chance_of_snow'] = dailychanceofsnow;
    data['condition'] = condition!.toJson();
    data['uv'] = uv;
    data['air_quality'] = airquality!.toJson();
    return data;
  }
}

class Forecast {
  List<Forecastday?>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
  // factory Forecast.fromJson(Map<String, dynamic> json) {
  //   if (json['forecast'] != null && json['forecast']['forecastday'] != null) {
  //     var forecastdayJson = json['forecast']['forecastday'] as List;
  //     List<Forecastday> forecastdayList = forecastdayJson.map((v) => Forecastday.fromJson(v)).toList();
  //     return Forecast(forecastday: forecastdayList);
  //   } else {
  //     return Forecast(); // Return an empty Forecast if there's no data
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastday'] = forecastday != null
        ? forecastday!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}

class Forecastday {
  String? date;
  num? dateepoch;
  Day? day;
  Astro? astro;
  List<Hour?>? hour;

  Forecastday({this.date, this.dateepoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateepoch = json['date_epoch'];
    day = json['day'] != null ? Day?.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro?.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['date_epoch'] = dateepoch;
    data['day'] = day!.toJson();
    data['astro'] = astro!.toJson();
    data['hour'] = hour != null ? hour!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Hour {
  num? timeepoch;
  String? time;
  num? tempc;
  num? tempf;
  num? isday;
  Condition? condition;
  num? windmph;
  num? windkph;
  num? winddegree;
  String? winddir;
  num? pressuremb;
  num? pressurein;
  num? precipmm;
  num? precipin;
  num? humidity;
  num? cloud;
  num? feelslikec;
  num? feelslikef;
  num? windchillc;
  num? windchillf;
  num? heatindexc;
  num? heatindexf;
  num? dewponumc;
  num? dewponumf;
  num? willitrain;
  num? chanceofrain;
  num? willitsnow;
  num? chanceofsnow;
  num? viskm;
  num? vismiles;
  num? gustmph;
  num? gustkph;
  num? uv;
  AirQuality? airquality;

  Hour(
      {this.timeepoch,
      this.time,
      this.tempc,
      this.tempf,
      this.isday,
      this.condition,
      this.windmph,
      this.windkph,
      this.winddegree,
      this.winddir,
      this.pressuremb,
      this.pressurein,
      this.precipmm,
      this.precipin,
      this.humidity,
      this.cloud,
      this.feelslikec,
      this.feelslikef,
      this.windchillc,
      this.windchillf,
      this.heatindexc,
      this.heatindexf,
      this.dewponumc,
      this.dewponumf,
      this.willitrain,
      this.chanceofrain,
      this.willitsnow,
      this.chanceofsnow,
      this.viskm,
      this.vismiles,
      this.gustmph,
      this.gustkph,
      this.uv,
      this.airquality});

  Hour.fromJson(Map<String, dynamic> json) {
    timeepoch = json['time_epoch'];
    time = json['time'];
    tempc = json['temp_c'];
    tempf = json['temp_f'];
    isday = json['is_day'];
    condition = json['condition'] != null
        ? Condition?.fromJson(json['condition'])
        : null;
    windmph = json['wind_mph'];
    windkph = json['wind_kph'];
    winddegree = json['wind_degree'];
    winddir = json['wind_dir'];
    pressuremb = json['pressure_mb'];
    pressurein = json['pressure_in'];
    precipmm = json['precip_mm'];
    precipin = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikec = json['feelslike_c'];
    feelslikef = json['feelslike_f'];
    windchillc = json['windchill_c'];
    windchillf = json['windchill_f'];
    heatindexc = json['heatindex_c'];
    heatindexf = json['heatindex_f'];
    dewponumc = json['dewponum_c'];
    dewponumf = json['dewponum_f'];
    willitrain = json['will_it_rain'];
    chanceofrain = json['chance_of_rain'];
    willitsnow = json['will_it_snow'];
    chanceofsnow = json['chance_of_snow'];
    viskm = json['vis_km'];
    vismiles = json['vis_miles'];
    gustmph = json['gust_mph'];
    gustkph = json['gust_kph'];
    uv = json['uv'];
    airquality = json['air_quality'] != null
        ? AirQuality?.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time_epoch'] = timeepoch;
    data['time'] = time;
    data['temp_c'] = tempc;
    data['temp_f'] = tempf;
    data['is_day'] = isday;
    data['condition'] = condition!.toJson();
    data['wind_mph'] = windmph;
    data['wind_kph'] = windkph;
    data['wind_degree'] = winddegree;
    data['wind_dir'] = winddir;
    data['pressure_mb'] = pressuremb;
    data['pressure_in'] = pressurein;
    data['precip_mm'] = precipmm;
    data['precip_in'] = precipin;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikec;
    data['feelslike_f'] = feelslikef;
    data['windchill_c'] = windchillc;
    data['windchill_f'] = windchillf;
    data['heatindex_c'] = heatindexc;
    data['heatindex_f'] = heatindexf;
    data['dewponum_c'] = dewponumc;
    data['dewponum_f'] = dewponumf;
    data['will_it_rain'] = willitrain;
    data['chance_of_rain'] = chanceofrain;
    data['will_it_snow'] = willitsnow;
    data['chance_of_snow'] = chanceofsnow;
    data['vis_km'] = viskm;
    data['vis_miles'] = vismiles;
    data['gust_mph'] = gustmph;
    data['gust_kph'] = gustkph;
    data['uv'] = uv;
    data['air_quality'] = airquality!.toJson();
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  num? lat;
  num? lon;
  String? tzid;
  num? localtimeepoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzid,
      this.localtimeepoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzid = json['tz_id'];
    localtimeepoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzid;
    data['localtime_epoch'] = localtimeepoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Root {
  Location? location;
  Current? current;
  Forecast? forecast;

  Root({this.location, this.current, this.forecast});

  Root.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current?.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast?.fromJson(json['forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['location'] = location!.toJson();
    data['current'] = current!.toJson();
    data['forecast'] = forecast!.toJson();
    return data;
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/