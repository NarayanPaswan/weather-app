import 'package:flutter/material.dart';
import 'package:weatherapp/pages/weather_details.dart';

import '../mock_data/country_map_data.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.text;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
             height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                     controller: searchController,
                    //  onChanged: (value){
                    //   setState(() {
                        
                    //   });
                    //  },
                     decoration:InputDecoration(
                       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                       hintText: 'Search your country',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(50),
                       )
                     ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      searchController.text;
                    });
                  }, child: const Text("Search"))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
    
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              // itemCount: countryList.length,
              // itemCount: countryListData.length,
              itemCount: countryListData.length,
              itemBuilder: (context, index) {
                String name = countryListData[index].name.toString();
                if(searchController.text.isEmpty){
                  
                  return InkWell(
                  onTap: (){
                  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherDetails(
                                countryName: countryListData[index].name.toString(),
                                
                              ),
                            ),
                          );
                       
                  },
                  child: ListTile(
                    title: Text(countryListData[index].name.toString()),
                  ),
                ); 

                }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){

                   return InkWell(
                  onTap: (){
                  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherDetails(
                                countryName: countryListData[index].name.toString(),
                                
                              ),
                            ),
                          );
                       
                  },
                  child: ListTile(
                    title: Text(countryListData[index].name.toString()),
                  ),
                ); 

                }else{
                  return Container();
                }
               
              },
            ),
          ),
        
        ],
      ),
    );
  }
}
