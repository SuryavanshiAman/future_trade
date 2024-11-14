class KycModel {
  int? status;
  String? msg;
  Data? data;

  KycModel({this.status, this.msg, this.data});

  KycModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  String? userId;
  String? aadhaarName;
  String? aadhaarNumber;
  String? panName;
  String? panNumber;
  String? aadhaarImg;
  String? panImg;
  String? status;
  String? datetime;

  Data(
      {this.id,
        this.userId,
        this.aadhaarName,
        this.aadhaarNumber,
        this.panName,
        this.panNumber,
        this.aadhaarImg,
        this.panImg,
        this.status,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    aadhaarName = json['aadhaar_name'];
    aadhaarNumber = json['aadhaar_number'];
    panName = json['pan_name'];
    panNumber = json['pan_number'];
    aadhaarImg = json['aadhaar_img'];
    panImg = json['pan_img'];
    status = json['status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['aadhaar_name'] = aadhaarName;
    data['aadhaar_number'] = aadhaarNumber;
    data['pan_name'] = panName;
    data['pan_number'] = panNumber;
    data['aadhaar_img'] = aadhaarImg;
    data['pan_img'] = panImg;
    data['status'] = status;
    data['datetime'] = datetime;
    return data;
  }
}
