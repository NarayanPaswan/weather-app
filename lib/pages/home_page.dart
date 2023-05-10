import 'package:flutter/material.dart';
import 'package:weatherapp/controller/all_countries_controller.dart';
import '../widgets/app_textform_field.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AllCountriesControllers allCountriesControllers = AllCountriesControllers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Column(
        children:  [
          AppTextFormField(),
          const ListTile(
                title: Text(
                  'GFG title',
                  textScaleFactor: 1.5,
                ),
                
          ),
          ElevatedButton(onPressed: ()async{
            allCountriesControllers.getAllCountries();
          }, child: const Text("Print here"))
          
        ],
      ),
    );
  }
}