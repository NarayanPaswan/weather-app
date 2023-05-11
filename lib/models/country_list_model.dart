class CountryList {
  String? name;
  CountryList(
      {
      this.name,
      });

  CountryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
 
}


