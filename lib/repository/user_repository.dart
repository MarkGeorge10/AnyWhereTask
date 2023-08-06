
import 'dart:convert';

import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/models/user_model.dart';


class UserRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<UserModel> loginRepo(UserModelRequestBody body) async {

    print(body.toLoginJson());

    print(AppUrl.loginEndPoint());

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.loginEndPoint(),body.toLoginJson());


      //print(json.decode(response));

      return response = UserModel.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserUpdateResponseBody> profileUpdate(UserUpdateRequestBody body) async {

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.profileUpdateEndPoint(),body.toJson());


      //print(json.decode(response));

      return response = UserUpdateResponseBody.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserOTPResponse> sendOTPUpdate(UserOTPRequest body) async {

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.requestOTPEndPoint(),body.toJson());


      //print(json.decode(response));

      return response = UserOTPResponse.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<ForgetPasswordResponse> resetPasswordRepo(ForgetPasswordBody body) async {

    print(body.toLoginJson());

    print(AppUrl.resetPasswordEndPoint());

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.resetPasswordEndPoint(),body.toLoginJson());


      //print(json.decode(response));

      return response = ForgetPasswordResponse.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }









}