import 'package:flutter/material.dart';
import 'package:weatherapp/models/book_detail_model.dart';

import '../../controller/books_controller.dart';

class BooksDetails extends StatefulWidget {
  String bookId;
  BooksDetails({super.key, required this.bookId});

  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  final booksControllerInstance = BooksControllers();
  @override
  void initState() {
    super.initState();
    print('Your book id is: ${widget.bookId}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books Details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: booksControllerInstance.getSingleBook(widget.bookId),
            builder: (context, AsyncSnapshot<BookDetailModel> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                if (snapshot.data == null || snapshot.data!.items!.isEmpty) {  
                  return const Center(
                    child: Text("Books detail not available !"),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        width: 160,
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data!.items!.first
                                .volumeInfo!.imageLinks!.thumbnail!),
                          ),
                        ),
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(snapshot.data?.items?.first.volumeInfo?.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(snapshot.data?.items?.first.volumeInfo?.subtitle.toString() ?? ''),
                     ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                                        color: Colors.black,
                                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data?.items?.first.volumeInfo?.description ?? ''),
                      )
                  ],
                );
              }
            }),
      ),
    );
  }
}
