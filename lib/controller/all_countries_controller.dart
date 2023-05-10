import 'dart:convert';

import 'package:weatherapp/models/country_list_model.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/services/utils/app_constant.dart';

class AllCountriesControllers {
 final dio = Dio();


// getAllCountries ()async{
//  final response = await dio.get(
//   AppConstants.allCountries,
//   options: Options(
//         contentType: 'application/json',
//     ),
//   );
//   print(response.data);

//  }

Future<CountryList>  getAllCountries ()async{

 final response = await dio.get(
  AppConstants.allCountries,
  options: Options(
        contentType: 'application/json',
    ),
  );
  return CountryList.fromJson(response.data);

 }
 

}