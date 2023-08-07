class SrcOptionsModel {
  String? directory;
  int? isFanon;
  int? isMediawiki;
  int? isWikipedia;
  String? language;
  String? minAbstractLength;
  int? skipAbstract;
  int? skipAbstractParen;
  String? skipEnd;
  int? skipIcon;
  int? skipImageName;
  String? skipQr;
  String? sourceSkip;
  String? srcInfo;

  SrcOptionsModel(
      {this.directory,
        this.isFanon,
        this.isMediawiki,
        this.isWikipedia,
        this.language,
        this.minAbstractLength,
        this.skipAbstract,
        this.skipAbstractParen,
        this.skipEnd,
        this.skipIcon,
        this.skipImageName,
        this.skipQr,
        this.sourceSkip,
        this.srcInfo});

  SrcOptionsModel.fromJson(Map<String, dynamic> json) {
    directory = json['directory']?? "";
    isFanon = json['is_fanon']?? 0;
    isMediawiki = json['is_mediawiki']??0;
    isWikipedia = json['is_wikipedia']??0;
    language = json['language']??"";
    minAbstractLength = json['min_abstract_length']??"";
    skipAbstract = json['skip_abstract'];
    skipAbstractParen = json['skip_abstract_paren'];
    skipEnd = json['skip_end'];
    skipIcon = json['skip_icon'];
    skipImageName = json['skip_image_name'];
    skipQr = json['skip_qr'];
    sourceSkip = json['source_skip'];
    srcInfo = json['src_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['directory'] = directory;
    data['is_fanon'] = isFanon;
    data['is_mediawiki'] = isMediawiki;
    data['is_wikipedia'] = isWikipedia;
    data['language'] = language;
    data['min_abstract_length'] = minAbstractLength;
    data['skip_abstract'] = skipAbstract;
    data['skip_abstract_paren'] = skipAbstractParen;
    data['skip_end'] = skipEnd;
    data['skip_icon'] = skipIcon;
    data['skip_image_name'] = skipImageName;
    data['skip_qr'] = skipQr;
    data['source_skip'] = sourceSkip;
    data['src_info'] = srcInfo;
    return data;
  }
}