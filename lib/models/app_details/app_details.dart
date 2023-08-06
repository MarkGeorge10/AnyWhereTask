


class AppDetailsModel {

  late final int id;
  late final String aboutus;
  late final String termsAndConditions;
  late final String whatsAppNumber;
  late final String privacyPolicy;

  AppDetailsModel({
    required this.id,
    required this.aboutus,
    required this.termsAndConditions,
    required this.whatsAppNumber,
    required this.privacyPolicy,
  });

  AppDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    aboutus = json['aboutus'];
    termsAndConditions = json['termsandconditions'];
    whatsAppNumber = json['whatsappnumber'];
    privacyPolicy = json['privacypolicy'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['aboutus'] = aboutus;
    _data['termsandconditions'] = termsAndConditions;
    _data['whatsappnumber'] = whatsAppNumber;
    _data['privacypolicy'] = privacyPolicy;
    return _data;
  }
}