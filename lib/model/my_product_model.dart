class MyProductModel {
  int? status;
  String? msg;
  List<Data>? data;

  MyProductModel({this.status, this.msg, this.data});

  MyProductModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? productName;
  String? projectID;
  String? productImg;
  String? productPrice;
  String? monthlyIncome;
  String? roi;
  String? status;

  Data(
      {this.userId,
        this.productName,
        this.projectID,
        this.productImg,
        this.productPrice,
        this.monthlyIncome,
        this.roi,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productName = json['product_name'];
    projectID = json['project_id'];
    productImg = json['product_img'];
    productPrice = json['price'];
    monthlyIncome = json['monthly_income'];
    roi = json['roi'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_name'] = productName;
    data['project_id'] = projectID;
    data['product_img'] = productImg;
    data['price'] = productPrice;
    data['monthly_income'] = monthlyIncome;
    data['roi'] = roi;
    data['status'] = status;
    return data;
  }
}
