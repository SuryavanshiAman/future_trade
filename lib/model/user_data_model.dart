class UserDataModel {
  int? status;
  String? msg;
  Data? data;

  UserDataModel({this.status, this.msg, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? status;
  String? isAuthorized;
  String? referralCode;
  String? joinBy;
  String? datetime;
  String? wallet;
  String? levelEncome;

  Data(
      {this.id,
        this.userId,
        this.name,
        this.phone,
        this.email,
        this.photo,
        this.status,
        this.isAuthorized,
        this.referralCode,
        this.joinBy,
        this.datetime,
        this.wallet,
        this.levelEncome});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    status = json['status'];
    isAuthorized = json['isAuthorized'];
    referralCode = json['referral_code'];
    joinBy = json['join_by'];
    datetime = json['datetime'];
    wallet = json['wallet'];
    levelEncome = json['level_encome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['photo'] = photo;
    data['status'] = status;
    data['isAuthorized'] = isAuthorized;
    data['referral_code'] = referralCode;
    data['join_by'] = joinBy;
    data['datetime'] = datetime;
    data['wallet'] = wallet;
    data['level_encome'] = levelEncome;
    return data;
  }
}
