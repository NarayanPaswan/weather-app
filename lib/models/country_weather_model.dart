class CountryWeatherModel {
  Location? location;
  Current? current;

  CountryWeatherModel({this.location, this.current});

  CountryWeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }
 
}

class Location {
  String? name;
  String? region;
  String? country;
  Location(
      {this.name,
      this.region,
      this.country,
      });
  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'].toString();
  }

}

class Current {
  num? tempC;
  double? tempF;
  Current(
      {
      this.tempC,
      this.tempF,
      });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    tempF = json['temp_f'];
  }

}


