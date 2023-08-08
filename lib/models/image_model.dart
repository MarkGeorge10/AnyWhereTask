class ImageModel {
  String? height;
  String? uRL;
  String? width;

  ImageModel({this.height, this.uRL, this.width});

  ImageModel.fromJson(Map<String, dynamic> json) {
    //height = json['Height']?? "";
    uRL = json['URL']?? "";
    //width = json['Width']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Height'] = height;
    data['URL'] = uRL;
    data['Width'] = width;
    return data;
  }
}
