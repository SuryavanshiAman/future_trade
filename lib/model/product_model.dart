class ProductModel {
  int? status;
  String? msg;
  List<Data>? data;

  ProductModel({this.status, this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  String? type;
  String? productImg;
  String? productPrice;
  String? monthlyIncome;
  String? roi;
  String? description;
  String? accessLimit;
  String? status;
  String? datetime;

  Data(
      {this.id,
        this.productName,
        this.type,
        this.productImg,
        this.productPrice,
        this.monthlyIncome,
        this.roi,
        this.description,
        this.accessLimit,
        this.status,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    type = json['type'];
    productImg = json['product_img'];
    productPrice = json['product_price'];
    monthlyIncome = json['monthly_income'];
    roi = json['roi'];
    description = json['description'];
    accessLimit = json['Access_limit'];
    status = json['status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['type'] = type;
    data['product_img'] = productImg;
    data['product_price'] = productPrice;
    data['monthly_income'] = monthlyIncome;
    data['roi'] = roi;
    data['description'] = description;
    data['Access_limit'] = accessLimit;
    data['status'] = status;
    data['datetime'] = datetime;
    return data;
  }
}
