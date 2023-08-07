import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/models/meta_Model.dart';

class SearchModel {
  late String? abstract;
  late String? abstractSource;
  late String? abstractText;
  late String? abstractURL;
  late String? answer;
  late String? answerType;
  late String? definition;
  late String? definitionSource;
  late String? definitionURL;
  late String? entity;
  late String? heading;
  late String? image;
  late int? imageHeight;
  late int? imageIsLogo;
  late int? imageWidth;
  late String? infobox;
  late String? redirect;
  late List<Topics>? generalTopics;
  late List<RelatedTopics>? specificTopics;
  late List<Object>? results;
  late String? type;
  late MetaModel? meta;

  SearchModel(
      {this.abstract,
        this.abstractSource,
        this.abstractText,
        this.abstractURL,
        this.answer,
        this.answerType,
        this.definition,
        this.definitionSource,
        this.definitionURL,
        this.entity,
        this.heading,
        this.image,
        this.imageHeight,
        this.imageIsLogo,
        this.imageWidth,
        this.infobox,
        this.redirect,
        this.specificTopics,
        this.generalTopics,
        this.results,
        this.type,
        this.meta});

  SearchModel.fromJson(Map<String?, dynamic> json) {


    // abstract = json['Abstract'] ?? "";
    // abstractSource = json['AbstractSource']?? "";
    // abstractText = json['AbstractText']?? "";
    // abstractURL = json['AbstractURL']?? "";
    // answer = json['Answer']?? "";
    // answerType = json['AnswerType']?? "";
    // definition = json['Definition']?? "";
    // definitionSource = json['DefinitionSource']?? "";
    // definitionURL = json['DefinitionURL']?? "";
    // entity = json['Entity']?? "";
    // heading = json['Heading']?? "";
    // image = json['Image']?? "";
    // imageHeight = json['ImageHeight']?? "";
    // imageIsLogo = json['ImageIsLogo']?? "";
    // imageWidth = json['ImageWidth']?? "";
    // infobox = json['Infobox']?? "";
    // redirect = json['Redirect']?? "";

    if (json['RelatedTopics'] != null) {
      specificTopics = <RelatedTopics>[];
      generalTopics = <Topics>[];

      json['RelatedTopics'].forEach((v) {
        if (v.containsKey('Name') && v.containsKey('Topics') ){
          // do your work
          specificTopics!.add(RelatedTopics.fromJson(v));
        }
        else{
          generalTopics!.add(Topics.fromJson(v));
        }

      });
    }
    // if (json['Results'] != null) {
    //   results = List<Object>();
    //   json['Results'].forEach((v) {
    //     results!.add(v);
    //   });
    // }
    type = json['Type'];
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
  }

// Map<String?, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['Abstract'] = abstract;
//   data['AbstractSource'] = abstractSource;
//   data['AbstractText'] = abstractText;
//   data['AbstractURL'] = abstractURL;
//   data['Answer'] = answer;
//   data['AnswerType'] = answerType;
//   data['Definition'] = definition;
//   data['DefinitionSource'] = definitionSource;
//   data['DefinitionURL'] = definitionURL;
//   data['Entity'] = entity;
//   data['Heading'] = heading;
//   data['Image'] = image;
//   data['ImageHeight'] = imageHeight;
//   data['ImageIsLogo'] = imageIsLogo;
//   data['ImageWidth'] = imageWidth;
//   data['Infobox'] = infobox;
//   data['Redirect'] = redirect;
//   if (relatedTopics != null) {
//     data['RelatedTopics'] =
//         relatedTopics!.map((v) => v.toJson()).toList();
//   }
//   // if (results != null) {
//   //   data['Results'] = results!.map((v) => v.toJson()).toList();
//   // }
//   data['Type'] = type;
//   if (meta != null) {
//     data['meta'] = meta!.toJson();
//   }
//   return data;
// }
}

