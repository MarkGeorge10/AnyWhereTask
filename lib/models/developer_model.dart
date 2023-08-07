
class DeveloperModel {
  String? name;
  String? type;
  String? url;

  DeveloperModel({this.name, this.type, this.url});

  DeveloperModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?? "";
    type = json['type']?? "";
    url = json['url']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}