class MaintainerModel {
  String? github;

  MaintainerModel({this.github});

  MaintainerModel.fromJson(Map<String, dynamic> json) {
    github = json['github']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['github'] = github;
    return data;
  }
}