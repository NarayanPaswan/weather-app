// import 'package:flutter/material.dart';
// import 'package:weatherapp/pages/weather_details.dart';

// import '../mock_data/country_map_data.dart';



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Weather App"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//              height: 50,
//               child: Row(
//                 children: [
//                   Flexible(
//                     flex: 3,
//                     child: TextFormField(
//                      controller:   searchController,
//                      decoration:InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//                        hintText: 'Search your country',
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(50),
//                        )
//                      ),
//                     ),
//                   ),
//                   const SizedBox(width: 5,),
//                   Flexible(
//                     child: ElevatedButton(onPressed: (){
                      
//                     }, child: const Text("Search")))
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20,),
    
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               // itemCount: countryList.length,
//               // itemCount: countryListData.length,
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: (){
                  
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => WeatherDetails(
//                                 countryName: countryListData[index].name.toString(),
                                
//                               ),
//                             ),
//                           );
                       
//                   },
//                   child: ListTile(
//                     title: Text(countryListData[index].name.toString()),
//                   ),
//                 ); 
               
//               },
//             ),
//           ),
        
//         ],
//       ),
//     );
//   }
// }
