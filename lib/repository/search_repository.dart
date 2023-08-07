

import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/models/search_model.dart';

class SearchRepository{

  final NetworkApiServices _apiServices = NetworkApiServices();




  Future<SearchModel> getDuckData(Map<String,String>query) async {



    print(AppUrl);

    try {

      dynamic response =
      await _apiServices.getGetApiParamResponse(AppUrl.loginEndPoint(),query);


      return response = SearchModel.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}