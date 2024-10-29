class DownlineModel {
  int? status;
  String? msg;
  Data? data;

  DownlineModel({this.status, this.msg, this.data});

  DownlineModel.fromJson(Map<String, dynamic> json) {
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
  String? totalPayout;
  String? totalIncome;
  String? incomeWallet;
  String? teamIncome;
  String? activeDownline;
  String? todayTeamBusiness;
  String? totalPayIn;

  Data(
      {this.totalPayout,
        this.totalIncome,
        this.incomeWallet,
        this.teamIncome,
        this.activeDownline,
        this.todayTeamBusiness,
        this.totalPayIn
      });

  Data.fromJson(Map<String, dynamic> json) {
    totalPayout = json['totalPayout'];
    totalIncome = json['Total_income'];
    incomeWallet = json['income_wallet'];
    teamIncome = json['teamIncome'];
    activeDownline = json['activeDdownline'];
    todayTeamBusiness = json['todayTeamBusiness'];
    totalPayIn = json['total_payin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPayout'] = totalPayout;
    data['Total_income'] = totalIncome;
    data['income_wallet'] = incomeWallet;
    data['teamIncome'] = teamIncome;
    data['activeDdownline'] = activeDownline;
    data['todayTeamBusiness'] = todayTeamBusiness;
    data['total_payin'] = totalPayIn;
    return data;
  }
}
