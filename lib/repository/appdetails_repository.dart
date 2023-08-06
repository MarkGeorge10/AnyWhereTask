

import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/models/app_details/app_details.dart';


class AppDetailsRepository{


  Future<AppDetailsModel> getAppDetailsApi() async {

    final NetworkApiServices _apiServices = NetworkApiServices();


    print(AppUrl.appDetailsEndPoint());

    try {

      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.appDetailsEndPoint());

      List<AppDetailsModel> list = [];

      for(var item in response){
        list.add(AppDetailsModel.fromJson(item));
      }

      return response = list[0];
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}