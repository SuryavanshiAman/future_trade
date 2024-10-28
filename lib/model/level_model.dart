// class LevelModel {
//   int? status;
//   String? msg;
//   List<Data>? data;
//
//   LevelModel({this.status, this.msg, this.data});
//
//   LevelModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? teamLevel;
//   String? userId;
//   String? name;
//   String? phone;
//   String? levelIncome;
//   String? datetime;
//   String? totalCount;
//
//   Data(
//       {this.teamLevel,
//         this.userId,
//         this.name,
//         this.phone,
//         this.levelIncome,
//         this.datetime,
//         this.totalCount});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     teamLevel = json['team_level'];
//     userId = json['user_id'];
//     name = json['name'];
//     phone = json['phone'];
//     levelIncome = json['level_income'];
//     datetime = json['datetime'];
//     totalCount = json['total_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['team_level'] = teamLevel;
//     data['user_id'] = userId;
//     data['name'] = name;
//     data['phone'] = phone;
//     data['level_income'] = levelIncome;
//     data['datetime'] = datetime;
//     data['total_count'] = totalCount;
//     return data;
//   }
// }
class LevelModel {
  int? status;
  String? msg;
  List<Data>? data;

  LevelModel({this.status, this.msg, this.data});

  LevelModel.fromJson(Map<String, dynamic> json) {
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
  String? teamLevel;
  int? totalCount;
  List<A>? a;
  List<B>? b;
  List<C>? c;
  List<D>? d;
  List<E>? e;

  Data({this.teamLevel, this.totalCount, this.a, this.b, this.c, this.d, this.e});

  Data.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    totalCount = json['total_count'];
    if (json['A'] != null) {
      a = <A>[];
      json['A'].forEach((v) {
        a!.add(A.fromJson(v));
      });
    }
    if (json['B'] != null) {
      b = <B>[];
      json['B'].forEach((v) {
        b!.add(B.fromJson(v));
      });
    }
    if (json['C'] != null) {
      c = <C>[];
      json['C'].forEach((v) {
        c!.add(C.fromJson(v));
      });
    }
    if (json['D'] != null) {
      d = <D>[];
      json['D'].forEach((v) {
        d!.add(D.fromJson(v));
      });
    }
    if (json['E'] != null) {
      e = <E>[];
      json['E'].forEach((v) {
        e!.add(E.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['total_count'] = totalCount;
    if (a != null) {
      data['A'] = a!.map((v) => v.toJson()).toList();
    }
    if (b != null) {
      data['B'] = b!.map((v) => v.toJson()).toList();
    }
    if (c != null) {
      data['C'] = c!.map((v) => v.toJson()).toList();
    }
    if (d != null) {
      data['D'] = d!.map((v) => v.toJson()).toList();
    }
    if (e != null) {
      data['E'] = e!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class A {
  String? teamLevel;
  String? userId;
  String? name;
  String? phone;
  String? levelIncome;
  String? datetime;

  A({this.teamLevel, this.userId, this.name, this.phone, this.levelIncome, this.datetime});

  A.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    levelIncome = json['level_income'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['level_income'] = levelIncome;
    data['datetime'] = datetime;
    return data;
  }
}

class B {
  String? teamLevel;
  String? userId;
  String? name;
  String? phone;
  String? levelIncome;
  String? datetime;

  B({this.teamLevel, this.userId, this.name, this.phone, this.levelIncome, this.datetime});

  B.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    levelIncome = json['level_income'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['level_income'] = levelIncome;
    data['datetime'] = datetime;
    return data;
  }
}

class C {
  String? teamLevel;
  String? userId;
  String? name;
  String? phone;
  String? levelIncome;
  String? datetime;

  C({this.teamLevel, this.userId, this.name, this.phone, this.levelIncome, this.datetime});

  C.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    levelIncome = json['level_income'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['level_income'] = levelIncome;
    data['datetime'] = datetime;
    return data;
  }
}

class D {
  String? teamLevel;
  String? userId;
  String? name;
  String? phone;
  String? levelIncome;
  String? datetime;

  D({this.teamLevel, this.userId, this.name, this.phone, this.levelIncome, this.datetime});

  D.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    levelIncome = json['level_income'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['level_income'] = levelIncome;
    data['datetime'] = datetime;
    return data;
  }
}

class E {
  String? teamLevel;
  String? userId;
  String? name;
  String? phone;
  String? levelIncome;
  String? datetime;

  E({this.teamLevel, this.userId, this.name, this.phone, this.levelIncome, this.datetime});

  E.fromJson(Map<String, dynamic> json) {
    teamLevel = json['team_level'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    levelIncome = json['level_income'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_level'] = teamLevel;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['level_income'] = levelIncome;
    data['datetime'] = datetime;
    return data;
  }
}
