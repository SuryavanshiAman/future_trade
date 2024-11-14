class NoteModel {
  int? status;
  String? msg;
  Data? data;

  NoteModel({this.status, this.msg, this.data});

  NoteModel.fromJson(Map<String, dynamic> json) {
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
  String? homeNote;
  String? roiNote;
  String? salaryNote;

  Data({this.id, this.homeNote, this.roiNote, this.salaryNote});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeNote = json['homeNote'];
    roiNote = json['roiNote'];
    salaryNote = json['salaryNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['homeNote'] = homeNote;
    data['roiNote'] = roiNote;
    data['salaryNote'] = salaryNote;
    return data;
  }
}
