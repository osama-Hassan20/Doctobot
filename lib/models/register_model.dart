class RegisterModel {
  DataRegister? dataRegister;
  String? token;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    dataRegister = json['data_register'] != null
        ? new DataRegister.fromJson(json['data_register'])
        : null;
    token = json['token'];
  }
}

class DataRegister {
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
