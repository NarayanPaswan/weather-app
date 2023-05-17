import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weatherapp/controller/books_controller.dart';
import 'package:weatherapp/models/books_category_model.dart';
import 'package:weatherapp/pages/news/books_details.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/services/utils/app_constant.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  final booksControllerInstance = BooksControllers();
  TextEditingController bookSearchController = TextEditingController();
  Timer? _debounceTimer;
  bool isDataFound = true;

  Future<BooksCategoryModel> getSearchedBooks (input)async{
    if (input.isEmpty) {
    setState(() {
      isDataFound = false;
    });
    return BooksCategoryModel();
  }
 final dio = Dio();
 final response = await dio.get(
  '${AppConstants.booksCategoryUri}q=$input&langRestrict=en',
  options: Options(
        contentType: 'application/json',
    ),
  );
  return BooksCategoryModel.fromJson(response.data);
 }
 

  @override
  void dispose() {
    super.dispose();
    bookSearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books Category"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        controller: bookSearchController,
                        onChanged: (value) {
                          // Cancel any existing Timer
                          if (_debounceTimer != null) {
                            _debounceTimer!.cancel();
                          }
        
                          // Start a new Timer with delay of 2 seconds
                          _debounceTimer = Timer(const Duration(seconds: 1), () {
                            setState(() {
                              isDataFound = true;
                            });
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Search your book here',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
            // if (!isDataFound) const Text("Search not found!"),
            // if (bookSearchController.text.isEmpty) const Text("Show other widget narayan"),
            
            FutureBuilder(
                future:getSearchedBooks(bookSearchController.text.toString()),
                builder: (context, AsyncSnapshot<BooksCategoryModel> snapshotSearch) {
                  if (!snapshotSearch.hasData) {

                     return const Text("Search not found!");
               
                  } else if (snapshotSearch.hasError) {
                    return Center(
                      child: Text(snapshotSearch.error.toString()),
                    );
                  } else {
                   if (snapshotSearch.data == null || snapshotSearch.data!.items == null || snapshotSearch.data!.items!.isEmpty) {
                      return const Center(
                        child: Text("Search not found !"),
                      );
                    }else{
                      return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,//it increase or decrease height of picture.
                            ),
                          scrollDirection: Axis.vertical, 
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshotSearch.data!.items!.length,
                          itemBuilder: (context, index) {
                                  
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BooksDetails(
                                        bookId: snapshotSearch.data!.items![index].id
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                 width: 160,
                                 height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(snapshotSearch
                                          .data!
                                          .items![index]
                                          .volumeInfo!
                                          .imageLinks!
                                          .thumbnail!),
                                    ),
                                  ),
                                ),
                              );
                            },
                          
                        ),
                    );
                    }
                    
                  }
                }
              ),
             
          ],
        ),
      ),
    );
  }
}
