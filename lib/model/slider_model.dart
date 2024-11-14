class BannerModel {
  int? status;
  String? msg;
  List<Data>? data;

  BannerModel({this.status, this.msg, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? slider1;

  Data({this.id, this.slider1});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slider1 = json['slider1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slider1'] = slider1;
    return data;
  }
}
