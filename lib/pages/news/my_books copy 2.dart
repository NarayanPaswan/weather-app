// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:weatherapp/controller/books_controller.dart';
// import 'package:weatherapp/models/books_category_model.dart';
// import 'package:weatherapp/pages/news/books_details.dart';

// class MyBooks extends StatefulWidget {
//   const MyBooks({super.key});

//   @override
//   State<MyBooks> createState() => _MyBooksState();
// }

// class _MyBooksState extends State<MyBooks> {
//   final booksControllerInstance = BooksControllers();
//   TextEditingController bookSearchController = TextEditingController();
//   Timer? _debounceTimer;
//   List<Items>? searchResults;


//   @override
//   void dispose() {
//     super.dispose();
//     bookSearchController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Books Category"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
            
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: bookSearchController,
//                         onChanged: (value) {
//                           // Cancel any existing Timer
//                           if (_debounceTimer != null) {
//                             _debounceTimer!.cancel();
//                           }
      
//                           // Start a new Timer with delay of 2 seconds
//                           _debounceTimer = Timer(const Duration(seconds: 2), () async{
//                           final results = await booksControllerInstance.getSearchedBooks(value);
//                             setState(() {
//                               searchResults = results.items;
//                             });
//                           });
//                         },
//                         decoration: InputDecoration(
//                             contentPadding:
//                                 const EdgeInsets.symmetric(horizontal: 20),
//                             hintText: 'Search your book here',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
          
//         if (bookSearchController.text.isEmpty) ...[
//             Text("show Category data"),
//         ] else ...[
//           FutureBuilder(
               
//                 future:
//                     booksControllerInstance.getSearchedBooks(bookSearchController.text),
//                 builder: (context, AsyncSnapshot<BooksCategoryModel> snapshot) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 20.0),
//                         height: 200.0,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: searchResults?.length ?? snapshot.data!.items!.length,
//                           itemBuilder: (context, index) {
//                              final item = searchResults?[index] ?? snapshot.data!.items![index];
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BooksDetails(
//                                           bookId: item.id.toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: 160,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(
//                                           item.volumeInfo?.imageLinks?.thumbnail ??
//                                           '',
//                                             ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
                            
//                           },
//                         ),
//                       ),
//                     );
//                   }
                
//                 ),
//         ] 
          
            
            
//           ],
//         ),
//       ),
//     );
//   }
// }
