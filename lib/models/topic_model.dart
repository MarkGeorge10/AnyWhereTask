
import 'package:anywheretask/models/developer_model.dart';
import 'package:anywheretask/models/image_model.dart';

class RelatedTopics {

  String? name;
  List<Topics>? topics;

  RelatedTopics(
      {
        this.name,
        this.topics});

  RelatedTopics.fromJson(Map<String, dynamic> json) {

      name = json['Name']?? "";
      if (json['Topics'] != null) {
        topics = <Topics>[];
        json['Topics'].forEach((v) {
          topics!.add(Topics.fromJson(v));
        });
      }

    }

    // else{
    //   if (json['Topics'] != null) {
    //     generalTopics = <Topics>[];
    //     json['Topics'].forEach((v) {
    //       generalTopics!.add(Topics.fromJson(v));
    //     });
    //   }
    // }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['FirstURL'] = firstURL;
//   if (icon != null) {
//     data['Icon'] = icon!.toJson();
//   }
//   data['Result'] = result;
//   data['Text'] = text;
//   data['Name'] = name;
//   if (topics != null) {
//     data['Topics'] = topics!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }


  }


class Topics {
  String? firstURL;
  ImageModel? icon;
  String? result;
  String? text;

  Topics({this.firstURL, this.icon, this.result, this.text});

  Topics.fromJson(Map<String, dynamic> json) {
    firstURL = json['FirstURL']?? "";
    icon = json['Icon'] != null ? ImageModel.fromJson(json['Icon']) : null;
    result = json['Result']?? "";
    text = json['Text']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstURL'] = firstURL;
    if (icon != null) {
      data['Icon'] = icon!.toJson();
    }
    data['Result'] = result;
    data['Text'] = text;
    return data;
  }
}








