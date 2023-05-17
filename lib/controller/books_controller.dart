
import 'package:dio/dio.dart';
import 'package:weatherapp/models/book_detail_model.dart';
import 'package:weatherapp/services/utils/app_constant.dart';
import '../models/books_category_model.dart';

class BooksControllers {
 final dio = Dio();
String fiction = 'Fiction';
String biographies = 'biographies';    

Future<BooksCategoryModel> getFictionCategoryBooks (fiction)async{
 final response = await dio.get(
  '${AppConstants.booksCategoryUri}q=$fiction&langRestrict=en',
  options: Options(
        contentType: 'application/json',
    ),
  );
  return BooksCategoryModel.fromJson(response.data);
 }

 Future<BooksCategoryModel> getBiographiesCategoryBooks (biographies)async{
  
 final response = await dio.get(
  '${AppConstants.booksCategoryUri}q=$biographies&langRestrict=en',
  options: Options(
        contentType: 'application/json',
    ),
  );
  return BooksCategoryModel.fromJson(response.data);
  // print(response.data);
  
 }

 Future<BookDetailModel> getSingleBook (bookId)async{
  // print('${AppConstants.booksCategoryUri}q=$bookId&langRestrict=en');
 final response = await dio.get(
  '${AppConstants.booksCategoryUri}q=$bookId&langRestrict=en',
  options: Options(
        contentType: 'application/json',
    ),
  );
  return BookDetailModel.fromJson(response.data);
 }

//  Future<BooksCategoryModel> getSearchedBooks (input)async{
//     if (input.isEmpty) {
//     setState(() {
//       isDataFound = false;
//     });
//     return null;
//   }

//  final response = await dio.get(
//   '${AppConstants.booksCategoryUri}q=$input&langRestrict=en',
//   options: Options(
//         contentType: 'application/json',
//     ),
//   );
//   return BooksCategoryModel.fromJson(response.data);
//  }



 


}