
class UserUpdateRequestBody {

  late final String patientId;
  late final String email;
  late final String mobile;

  UserUpdateRequestBody({
    required this.patientId,
    required this.email,
    required this.mobile,
  });

  UserUpdateRequestBody.fromJson(Map<String, dynamic> json){
    patientId = json['patientId'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['patientId'] = patientId;
    _data['email'] = email;
    _data['mobile'] = mobile;

    return _data;
  }
}
class UserUpdateResponseBody {

  late final String updatedEmail;
  late final String updatedMobile;

  UserUpdateResponseBody({
    required this.updatedEmail,
    required this.updatedMobile,
  });

  UserUpdateResponseBody.fromJson(Map<String, dynamic> json){
    updatedEmail = json['updatedEmail'];
    updatedMobile = json['updatedMobile'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['updatedEmail'] = updatedEmail;
    _data['updatedMobile'] = updatedMobile;

    return _data;
  }
}

class ForgetPasswordBody {

  late final String civilId;
  late final String tempPassword;
  late final String newPassword;

  ForgetPasswordBody({
    required this.civilId,
    required this.tempPassword,
    required this.newPassword,
  });

  ForgetPasswordBody.fromJson(Map<String, dynamic> json){
    civilId = json['CivilId'];
    tempPassword = json['TempPassword'];
    newPassword = json['NewPassword'];

  }

  Map<String, dynamic> toLoginJson() {
    final _data = <String, dynamic>{};
    _data['CivilId'] = civilId;
    _data['TempPassword'] = tempPassword;
    _data['NewPassword'] = newPassword;
    return _data;
  }
}
class ForgetPasswordResponse {

  late final bool passwordChange;


  ForgetPasswordResponse({
    required this.passwordChange,

  });

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json){
    passwordChange = json['passwordChange'];


  }

}


class UserOTPRequest {

  late final String civilId;
  late final String email;
  late final String tempPassword;





  UserOTPRequest({
    required this.civilId,
    required this.email,
    required this.tempPassword,

  });


  UserOTPRequest.fromJson(Map<String, dynamic> json){
    civilId = json['CivilId'];
    email = json['Email'];
    tempPassword = json['TempPassword'];
  }


//  Map<String, dynamic> toLoginJson() {
//    final _data = <String, dynamic>{};
//    _data['CivilId'] = CivilId;
//    _data['Password'] = Password;
//    _data['NFCKey'] = NFCKey;
//    _data['FirebaseKey'] = FirebaseKey;
//    return _data;
//  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['CivilId'] = civilId;
    _data['Email'] = email;
    _data['TempPassword'] = tempPassword;

    return _data;
  }
}

class UserOTPResponse {

  late final bool passwordReset;






  UserOTPResponse({
    required this.passwordReset,


  });


  UserOTPResponse.fromJson(Map<String, dynamic> json){
    passwordReset = json['passwordReset'];
  }


//  Map<String, dynamic> toLoginJson() {
//    final _data = <String, dynamic>{};
//    _data['CivilId'] = CivilId;
//    _data['Password'] = Password;
//    _data['NFCKey'] = NFCKey;
//    _data['FirebaseKey'] = FirebaseKey;
//    return _data;
//  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['passwordReset'] = passwordReset;


    return _data;
  }
}


class UserModelRequestBody {

  late final String civilId;
  late final String password;
  late final String nfcKey;
  late final String firebaseKey;

  UserModelRequestBody({
    required this.civilId,
    required this.password,
    required this.nfcKey,
    required this.firebaseKey,
  });

  UserModelRequestBody.fromJson(Map<String, dynamic> json){
    civilId = json['CivilId'];
    password = json['Password'];
    nfcKey = json['NFCKey'];
    firebaseKey = json['FirebaseKey'];
  }

  Map<String, dynamic> toLoginJson() {
    final _data = <String, dynamic>{};
    _data['CivilId'] = civilId;
    _data['Password'] = password;
    _data['NFCKey'] = nfcKey;
    _data['FirebaseKey'] = firebaseKey;
    return _data;
  }
}

class UserModel {

  late final int id;
  late final String name;
  late final String validate;
  late final int familyMembersCount;
  late final int visitsCount;
  late final double savedValue;
  late final String? img;
  late final String? grade;
  late final bool firstTimeLogin;
  String? email;
  String? mobile;


  late final String? civilId;
  late final String? pass;




  UserModel({
    required this.id,
    required this.name,
    required this.validate,
    required this.familyMembersCount,
    required this.visitsCount,
    required this.savedValue,
    required this.img,
    required this.grade,
    required this.firstTimeLogin,
    required this.email,
    required this.mobile,
    required this.civilId,
    required pass
  });


  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    validate = json['validate'];
    familyMembersCount = json['familyMembersCount'];
    visitsCount = json['visitsCount'];
    savedValue = json['savedValue'];
    img = json['img'];
    grade = json['grade'];
    firstTimeLogin = json['firstTimeLogin'];
    email = json['email'];
    mobile = json['mobile'];
  }

  UserModel.fromJsonPref(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    validate = json['validate'];
    familyMembersCount = json['familyMembersCount'];
    visitsCount = json['visitsCount'];
    savedValue = json['savedValue'];
    img = json['img'];
    grade = json['grade'];
    firstTimeLogin = json['firstTimeLogin'];
    mobile = json['mobile'];
    email = json['email'];
    civilId = json['civilId'];
    pass = json['pass'];
  }

//  Map<String, dynamic> toLoginJson() {
//    final _data = <String, dynamic>{};
//    _data['CivilId'] = CivilId;
//    _data['Password'] = Password;
//    _data['NFCKey'] = NFCKey;
//    _data['FirebaseKey'] = FirebaseKey;
//    return _data;
//  }



  Map<String, dynamic> toJsonPref() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['validate'] = validate;
    _data['familyMembersCount'] = familyMembersCount;
    _data['visitsCount'] = visitsCount;
    _data['savedValue'] = savedValue;
    _data['img'] = img;
    _data['grade'] = grade;
    _data['firstTimeLogin'] = firstTimeLogin;
    _data['email'] = email;
    _data['mobile'] = mobile;

    _data['civilId'] = civilId;
    _data['pass'] = pass;
    return _data;
  }
}
