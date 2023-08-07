 import 'dart:convert';
 import 'dart:io';

 import 'package:flutter/material.dart';

 import '../exception/AppException.dart';
 import 'base_api_services.dart';
 import 'package:http/http.dart' as http;

 class NetworkApiServices extends BaseApiServices {
   dynamic responseJson;

//   Map<String,String> userHeader = {
//     "Content-Type": "application/json",
//     "Accept": "application/json",
//   };


   @override
   Future getGetApiResponse(String url) async {
     try {
       final response = await http.get(Uri.parse(url));
       responseJson = returnResponse(response);
       print(response.statusCode.toString());

       print(response.body.toString());
     } on SocketException {

       throw FetchDataException('No Internet Connection');
     }

     return responseJson;
   }

   @override
   Future getGetApiParamResponse(String url, Map<String,String> queryParams) async {
     try {

       Uri uri = Uri.parse(url);
       final finalUri = uri.replace(queryParameters: queryParams); //USE THIS

       final response = await http.get(finalUri);
       responseJson = returnResponse(response);
       print(response.statusCode.toString());

       print(response.body.toString());
     } on SocketException {

       throw FetchDataException('No Internet Connection');
     }
     return responseJson;
   }

   @override
   Future getPostApiResponse(String url, dynamic data) async {
     dynamic responseJson;

     try {
       http.Response response = await http
           .post(Uri.parse(url), body: data)
           .timeout(const Duration(seconds: 10));
       responseJson = returnResponse(response);
     } on SocketException {
       throw FetchDataException('No Internet Connection');
     }

     return responseJson;
   }

   dynamic returnResponse(http.Response response) {
     switch (response.statusCode) {
       case 200:
         dynamic responseJson = jsonDecode(response.body);
         return responseJson;
       case 400:
         throw BadRequestException(response.body.toString());
       case 404:
         throw BadRequestException(response.body.toString());
       case 500:
         throw BadRequestException(response.body.toString());
       default:
         throw FetchDataException(
             "Error accourded while communicating with server with status code ${response.statusCode}");
     }
   }
 }

