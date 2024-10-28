class TransactionHistoryModel {
  int? status;
  String? msg;
  List<Data>? data;

  TransactionHistoryModel({this.status, this.msg, this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? amount;
  String? status;
  String? datetime;
  String? type;
  String? description;
  String? statusLabel;

  Data(
      {this.id,
        this.userId,
        this.amount,
        this.status,
        this.datetime,
        this.type,
        this.description,
        this.statusLabel});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    datetime = json['datetime'];
    type = json['type'];
    description = json['description'];
    statusLabel = json['status_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['status'] = status;
    data['datetime'] = datetime;
    data['type'] = type;
    data['description'] = description;
    data['status_label'] = statusLabel;
    return data;
  }
}
