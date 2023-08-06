import 'package:anywheretask/data/response/ApiResponse.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_details/app_details.dart';
import '../repository/appdetails_repository.dart';

class AppDetailsViewModel with ChangeNotifier {
  final AppDetailsRepository appDetailsRepository = AppDetailsRepository();

  ApiResponse<AppDetailsModel> appDetails = ApiResponse.loading(null);

  setAppDetailsData(ApiResponse<AppDetailsModel> response) {
    appDetails = response;
    notifyListeners();
  }

  getAppDetailsApi() async {
    await appDetailsRepository.getAppDetailsApi().then((value) {
      setAppDetailsData(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setAppDetailsData(ApiResponse.error(error.toString())));
  }

  String version = "";
  String code = "";
  getAppInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    code = packageInfo.buildNumber;
  }
}
