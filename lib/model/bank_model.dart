class BankModel {
  int? status;
  String? msg;
  Data? data;

  BankModel({this.status, this.msg, this.data});

  BankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
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
  String? accountHolder;
  String? accountNo;
  String? bankName;
  String? branchName;
  String? ifscCode;
  String? createdAt;

  Data(
      {this.id,
        this.userId,
        this.accountHolder,
        this.accountNo,
        this.bankName,
        this.branchName,
        this.ifscCode,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accountHolder = json['account_holder'];
    accountNo = json['account_no'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    ifscCode = json['ifsc_code'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['account_holder'] = accountHolder;
    data['account_no'] = accountNo;
    data['bank_name'] = bankName;
    data['branch_name'] = branchName;
    data['ifsc_code'] = ifscCode;
    data['created_at'] = createdAt;
    return data;
  }
}
