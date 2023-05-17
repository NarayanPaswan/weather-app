import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/country_weather_model.dart';

class WeatherDetails extends StatefulWidget {
  String countryName;
   WeatherDetails({super.key, required this.countryName});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  String place='';
  @override
  void initState() {
    
    super.initState();
    place = widget.countryName; 
    // print(widget.countryName);
    getCountriesWeather();
  }

final dio = Dio();
Future<CountryWeatherModel>getCountriesWeather ()async{
 final response = await dio.get(
  'http://api.weatherapi.com/v1/current.json?key=c8dc9e9e9daa47799cf134730231005&q=$place',
  options: Options(
        contentType: 'application/json',
    ),
  );

return CountryWeatherModel.fromJson(response.data);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather details"),
      ),
      body: FutureBuilder(
        future: getCountriesWeather(),
        builder: (context, AsyncSnapshot<CountryWeatherModel> snapshot){
          if(!snapshot.hasData){
            return const Center(
                  child: CircularProgressIndicator(),
                );
          }else if (snapshot.hasError){
            return Center(
                  child: Text(snapshot.error.toString()),
                );
          }else{
         return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 const Text("Country Name : ") , 
                  Text(snapshot.data!.location!.country.toString()),
                ],
              ),
            ),

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 const Text("Region : ") , 
                  Text(snapshot.data!.location!.region.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 const Text("Temp C : ") , 
                  Text(snapshot.data!.current!.tempC.toString()),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 const Text("Temp F : ") , 
                  Text(snapshot.data!.current!.tempF.toString()),
                ],
              ),
            ),
          ],
         );
        }
      }),
      
    );
  }
}