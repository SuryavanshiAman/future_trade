class AllPoliciesModel {
  int? status;
  String? msg;
  Data? data;

  AllPoliciesModel({this.status, this.msg, this.data});

  AllPoliciesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? support;
  String? aboutUs;
  String? privacy;
  String? term;
  String? status;
  String? datetime;

  Data(
      {this.id,
        this.support,
        this.aboutUs,
        this.privacy,
        this.term,
        this.status,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    support = json['support'];
    aboutUs = json['about_us'];
    privacy = json['privacy'];
    term = json['term'];
    status = json['status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['support'] = support;
    data['about_us'] = aboutUs;
    data['privacy'] = privacy;
    data['term'] = term;
    data['status'] = status;
    data['datetime'] = datetime;
    return data;
  }
}
