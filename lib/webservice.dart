import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/productlist.dart';

Future<Products>getproducts()async{
var jsonresponse=await rootBundle.loadString("assets/data.json");
//print("helloproducts:${jsonDecode(jsonresponse)}");
return Products.fromJson(jsonDecode(jsonresponse));
}