


import 'package:anywheretask/data/network/endpoints/key_utils.dart';

class AppUrl {




  ///login part
  static String loginEndPoint(){

    return "${KeyUtils.baseUrl}/login/login";
  }

  ///login part
  static String requestOTPEndPoint(){

    return "${KeyUtils.baseUrl}/login/requestOtp";
  }

  static String profileUpdateEndPoint(){

    return "${KeyUtils.baseUrl}/user/profileUpdate";
  }

  static String resetPasswordEndPoint(){

    return "${KeyUtils.baseUrl}/login/passwordreset";
  }

  /// user part
  static String userFamilyEndPoint(){

    return "${KeyUtils.baseUrl}/user/family";
  }

  static String userNotificationEndPoint(){

    return "${KeyUtils.baseUrl}/user/notification";
  }

  /// benefits part
  static String benefitsEndPoint(){

    return "${KeyUtils.baseUrl}/user/benefitsLimit";
  }

  /// visits part
  static String visitEndPoint(){

    return "${KeyUtils.baseUrl}/visit/get";
  }

 static String visitDetailsEndPoint(){

    return "${KeyUtils.baseUrl}/visit/details";
  }

  ///login part
  static String appDetailsEndPoint(){

    return "${KeyUtils.baseUrl}/info/getDetails";
  }


}