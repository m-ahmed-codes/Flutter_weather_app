class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usepaindex;
  int? gbdefraindex;

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
  String? moonillumination;
  int? ismoonup;
  int? issunup;

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
  int? code;

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
  int? lastupdatedepoch;
  String? lastupdated;
  double? tempc;
  double? tempf;
  int? isday;
  Condition? condition;
  double? windmph;
  double? windkph;
  int? winddegree;
  String? winddir;
  double? pressuremb;
  double? pressurein;
  double? precipmm;
  double? precipin;
  int? humidity;
  int? cloud;
  double? feelslikec;
  double? feelslikef;
  double? viskm;
  double? vismiles;
  double? uv;
  double? gustmph;
  double? gustkph;
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
  double? maxtempc;
  double? maxtempf;
  double? mintempc;
  double? mintempf;
  double? avgtempc;
  double? avgtempf;
  double? maxwindmph;
  double? maxwindkph;
  double? totalprecipmm;
  double? totalprecipin;
  double? totalsnowcm;
  double? avgviskm;
  double? avgvismiles;
  double? avghumidity;
  int? dailywillitrain;
  int? dailychanceofrain;
  int? dailywillitsnow;
  int? dailychanceofsnow;
  Condition? condition;
  double? uv;
  AirQuality? airquality;

  Day(
      {this.maxtempc,
      this.maxtempf,
      this.mintempc,
      this.mintempf,
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
    mintempc = json['mintemp_c'];
    mintempf = json['mintemp_f'];
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
    data['mintemp_c'] = mintempc;
    data['mintemp_f'] = mintempf;
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
  int? dateepoch;
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
  int? timeepoch;
  String? time;
  double? tempc;
  double? tempf;
  int? isday;
  Condition? condition;
  double? windmph;
  double? windkph;
  int? winddegree;
  String? winddir;
  double? pressuremb;
  double? pressurein;
  double? precipmm;
  double? precipin;
  int? humidity;
  int? cloud;
  double? feelslikec;
  double? feelslikef;
  double? windchillc;
  double? windchillf;
  double? heatindexc;
  double? heatindexf;
  double? dewpointc;
  double? dewpointf;
  int? willitrain;
  int? chanceofrain;
  int? willitsnow;
  int? chanceofsnow;
  double? viskm;
  double? vismiles;
  double? gustmph;
  double? gustkph;
  double? uv;
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
      this.dewpointc,
      this.dewpointf,
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
    dewpointc = json['dewpoint_c'];
    dewpointf = json['dewpoint_f'];
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
    data['dewpoint_c'] = dewpointc;
    data['dewpoint_f'] = dewpointf;
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
  double? lat;
  double? lon;
  String? tzid;
  int? localtimeepoch;
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
