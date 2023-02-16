class UserAuthRequest {
  String? email;
  String? name;
  String? idGoogle;

  UserAuthRequest({this.email, this.idGoogle, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['id_google'] = this.idGoogle;
    return data;
  }
}

class UserAuthResponse {
  bool? success;
  UserData? data;
  String? message;

  UserAuthResponse({this.success, this.data, this.message});

  UserAuthResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  UserDetail? detail;
  String? token;

  UserData({this.detail, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? new UserDetail.fromJson(json['detail']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserDetail {
  int? id;
  String? idGoogle;
  String? name;
  String? email;
  String? noTelp;
  String? imgUrl;
  String? registered;

  UserDetail(
      {this.id,
      this.idGoogle,
      this.name,
      this.email,
      this.noTelp,
      this.imgUrl,
      this.registered});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGoogle = json['id_google'];
    name = json['name'];
    email = json['email'];
    noTelp = json['no_telp'];
    imgUrl = json['img_url'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_google'] = this.idGoogle;
    data['name'] = this.name;
    data['email'] = this.email;
    data['no_telp'] = this.noTelp;
    data['img_url'] = this.imgUrl;
    data['registered'] = this.registered;
    return data;
  }
}
