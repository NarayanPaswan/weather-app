class CountryList {
  String? country;
  CountryList(
      {
      this.country,
      });

  CountryList.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }
 
}


