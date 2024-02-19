class QuoteTesting {
  QuoteTesting({
      this.id, 
      this.originator, 
      this.languageCode, 
      this.content, 
      this.url, 
      this.tags,});

  QuoteTesting.fromJson(dynamic json) {
    id = json['id'];
    originator = json['originator'] != null ? Originator.fromJson(json['originator']) : null;
    languageCode = json['language_code'];
    content = json['content'];
    url = json['url'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  int? id;
  Originator? originator;
  String? languageCode;
  String? content;
  String? url;
  List<String>? tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (originator != null) {
      map['originator'] = originator?.toJson();
    }
    map['language_code'] = languageCode;
    map['content'] = content;
    map['url'] = url;
    map['tags'] = tags;
    return map;
  }

}

class Originator {
  Originator({
      this.id, 
      this.languageCode, 
      this.description, 
      this.masterId, 
      this.name, 
      this.url,});

  Originator.fromJson(dynamic json) {
    id = json['id'];
    languageCode = json['language_code'];
    description = json['description'];
    masterId = json['master_id'];
    name = json['name'];
    url = json['url'];
  }
  int? id;
  String? languageCode;
  String? description;
  int? masterId;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['language_code'] = languageCode;
    map['description'] = description;
    map['master_id'] = masterId;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}