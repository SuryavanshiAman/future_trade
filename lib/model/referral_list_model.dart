class ReferralListModel {
  int? status;
  String? msg;
  List<Data>? data;

  ReferralListModel({this.status, this.msg, this.data});

  ReferralListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? username;
  String? img;
  String? totalProjects;
  String? status;

  Data({this.username, this.img, this.totalProjects, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    img = json['img'];
    totalProjects = json['total_projects'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['img'] = this.img;
    data['total_projects'] = this.totalProjects;
    data['status'] = this.status;
    return data;
  }
}
