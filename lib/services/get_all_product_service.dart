// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

getAllProducts() async{
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  var response = await http.get(url);

  try
  {
    if(response.statusCode == 200)
    {
      var jsonDecoded = jsonDecode(response.body);
      var data = FoodModel.fromJson(jsonDecoded);
      return data.recipes;
    }
    else
    {
      print("an error occurred");
    }
  }
  catch(e)
  {
    print(e.toString());
  }
}