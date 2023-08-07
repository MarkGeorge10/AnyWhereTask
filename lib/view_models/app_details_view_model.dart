
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';


class AppDetailsViewModel with ChangeNotifier {


  String version = "";
  String code = "";
  getAppInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    code = packageInfo.buildNumber;
  }
}
