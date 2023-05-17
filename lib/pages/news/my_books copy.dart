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
  
//   @override
//   void initState() {
//     booksControllerInstance.getBiographiesCategoryBooks('biographies');
//     super.initState();
//   }

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
//                           _debounceTimer = Timer(const Duration(seconds: 2), () {
//                             setState(() {
//                               // Perform search here
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
          
//             // Fiction
//             const Padding(
//               padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//               child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "Fiction",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   )),
//             ),
            
//             FutureBuilder(
//                 future:
//                     booksControllerInstance.getFictionCategoryBooks('Fiction'),
//                 builder: (context, AsyncSnapshot<BooksCategoryModel> snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text(snapshot.error.toString()),
//                     );
//                   } else {
//                     if (snapshot.data == null || snapshot.data!.items!.isEmpty) {
//                       return const Center(
//                         child: Text("Category not available !"),
//                       );
//                     }
      
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 20.0),
//                         height: 200.0,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.items!.length,
//                           itemBuilder: (context, index) {
//                             String title =
//                                 snapshot.data!.items![index].volumeInfo!.title!;
//                             if (bookSearchController.text.isEmpty) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BooksDetails(
//                                           bookId: snapshot.data!.items![index].id
//                                               .toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: 160,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(snapshot
//                                             .data!
//                                             .items![index]
//                                             .volumeInfo!
//                                             .imageLinks!
//                                             .thumbnail!),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             } else if (title.toLowerCase().contains(
//                                 bookSearchController.text.toLowerCase())) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BooksDetails(
//                                           bookId: snapshot.data!.items![index].id
//                                               .toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: 160,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(snapshot
//                                             .data!
//                                             .items![index]
//                                             .volumeInfo!
//                                             .imageLinks!
//                                             .thumbnail!),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return Container();
//                             }
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                 }
//                 ),
      
//                   //Biography
//             const Padding(
//               padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//               child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "Biography",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   )),
//             ),
            
//             FutureBuilder(
//                 future:
//                     booksControllerInstance.getBiographiesCategoryBooks('biographies'),
//                 builder: (context, AsyncSnapshot<BooksCategoryModel> snapshot) {
//                    print('you data: ${snapshot.data}'); // add this line to print the data
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text(snapshot.error.toString()),
//                     );
//                   } else {
//                     if (snapshot.data == null || snapshot.data!.items!.isEmpty) {
//                       return const Center(
//                         child: Text("Category not available !"),
//                       );
//                     }
      
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 20.0),
//                         height: 200.0,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.items!.length,
//                           itemBuilder: (context, index) {
//                             String title =
//                                 snapshot.data!.items![index].volumeInfo!.title!;
//                             if (bookSearchController.text.isEmpty) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BooksDetails(
//                                           bookId: snapshot.data!.items![index].id
//                                               .toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: 160,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(snapshot
//                                             .data!
//                                             .items![index]
//                                             .volumeInfo!
//                                             .imageLinks!
//                                             .thumbnail!),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             } else if (title.toLowerCase().contains(
//                                 bookSearchController.text.toLowerCase())) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BooksDetails(
//                                           bookId: snapshot.data!.items![index].id
//                                               .toString(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     width: 160,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(snapshot
//                                             .data!
//                                             .items![index]
//                                             .volumeInfo!
//                                             .imageLinks!
//                                             .thumbnail!),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return Container();
//                             }
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                 }),
             
//           ],
//         ),
//       ),
//     );
//   }
// }
