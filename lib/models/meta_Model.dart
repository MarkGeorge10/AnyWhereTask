import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/models/developer_model.dart';
import 'package:anywheretask/models/maintainer_model.dart';
import 'package:anywheretask/models/src_options_model.dart';

class MetaModel {
  Null attribution;
  Null blockgroup;
  Null createdDate;
  String? description;
  Null designer;
  Null devDate;
  String? devMilestone;
  List<DeveloperModel>? developer;
  String? exampleQuery;
  String? id;
  Null isStackexchange;
  String? jsCallbackName;
  Null liveDate;
  MaintainerModel? maintainer;
  String? name;
  String? perlModule;
  Null producer;
  String? productionState;
  String? repo;
  String? signalFrom;
  String? srcDomain;
  int? srcId;
  String? srcName;
  SrcOptionsModel? srcOptions;
  Null srcUrl;
  String? status;
  String? tab;
  List<String>? topic;
  int? unsafe;

  MetaModel(
      {this.attribution,
        this.blockgroup,
        this.createdDate,
        this.description,
        this.designer,
        this.devDate,
        this.devMilestone,
        this.developer,
        this.exampleQuery,
        this.id,
        this.isStackexchange,
        this.jsCallbackName,
        this.liveDate,
        this.maintainer,
        this.name,
        this.perlModule,
        this.producer,
        this.productionState,
        this.repo,
        this.signalFrom,
        this.srcDomain,
        this.srcId,
        this.srcName,
        this.srcOptions,
        this.srcUrl,
        this.status,
        this.tab,
        this.topic,
        this.unsafe});

  MetaModel.fromJson(Map<String, dynamic> json) {
    // attribution = json['attribution'] ?? "";
    //blockgroup = json['blockgroup']?? "";
    //createdDate = json['created_date']?? "";
    description = json['description']?? "";
    //designer = json['designer']?? "";
    //devDate = json['dev_date']?? "";
    devMilestone = json['dev_milestone']?? "";
    if (json['developer'] != null) {
      developer = <DeveloperModel>[];
      json['developer'].forEach((v) {
        developer!.add(DeveloperModel.fromJson(v));
      });
    }
    exampleQuery = json['example_query'];
    id = json['id'];
    isStackexchange = json['is_stackexchange'];
    jsCallbackName = json['js_callback_name'];
    liveDate = json['live_date'];
    maintainer = json['maintainer'] != null
        ? MaintainerModel.fromJson(json['maintainer'])
        : null;
    name = json['name'];
    perlModule = json['perl_module'];
    producer = json['producer'];
    productionState = json['production_state'];
    repo = json['repo'];
    signalFrom = json['signal_from'];
    srcDomain = json['src_domain'];
    srcId = json['src_id'];
    srcName = json['src_name'];
    srcOptions = json['src_options'] != null
        ? SrcOptionsModel.fromJson(json['src_options'])
        : null;
    //srcUrl = json['src_url']??"";
    status = json['status'];
    tab = json['tab'];
    topic = json['topic'].cast<String>();
    unsafe = json['unsafe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribution'] = attribution;
    data['blockgroup'] = blockgroup;
    data['created_date'] = createdDate;
    data['description'] = description;
    data['designer'] = designer;
    data['dev_date'] = devDate;
    data['dev_milestone'] = devMilestone;
    if (developer != null) {
      data['developer'] = developer!.map((v) => v.toJson()).toList();
    }
    data['example_query'] = exampleQuery;
    data['id'] = id;
    data['is_stackexchange'] = isStackexchange;
    data['js_callback_name'] = jsCallbackName;
    data['live_date'] = liveDate;
    if (maintainer != null) {
      data['maintainer'] = maintainer!.toJson();
    }
    data['name'] = name;
    data['perl_module'] = perlModule;
    data['producer'] = producer;
    data['production_state'] = productionState;
    data['repo'] = repo;
    data['signal_from'] = signalFrom;
    data['src_domain'] = srcDomain;
    data['src_id'] = srcId;
    data['src_name'] = srcName;
    if (srcOptions != null) {
      data['src_options'] = srcOptions!.toJson();
    }
    data['src_url'] = srcUrl;
    data['status'] = status;
    data['tab'] = tab;
    data['topic'] = topic;
    data['unsafe'] = unsafe;
    return data;
  }
}
