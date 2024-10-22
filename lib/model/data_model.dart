class DataModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  DataModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<Data> dataTemp = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        dataTemp.add(Data.fromJson(v));
      });
    }

    return DataModel(
        page: json['page'] ?? 0,
        perPage: json['per_page'] ?? 0,
        total: json['total'] ?? 0,
        support:
            json['support'] != null ? Support.fromJson(json['support']) : null,
        data: [...dataTemp]);
  }

  // page = json['page'];
  // perPage = json['per_page'];
  // total = json['total'];
  // totalPages = json['total_pages'];
  // if (json['data'] != null) {
  //   data = <Data>[];
  // json['data'].forEach((v) {
  //   data!.add(new Data.fromJson(v));
  // });
  // }
  // support =
  //     json['support'] != null ? new Support.fromJson(json['support']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        avatar: json['avatar'],
        lastName: json['last_name'],
        firstName: json['first_name'],
        email: json['email'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(text: json['url'], url: json['text']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
