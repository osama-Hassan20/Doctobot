class ChangeMyPassword {
  DataChangeMyPassword? dataChangeMyPassword;
  String? token;

  ChangeMyPassword.fromJson(Map<String, dynamic> json) {
    dataChangeMyPassword = json['dataChangeMyPassword'] != null
        ? new DataChangeMyPassword.fromJson(json['dataChangeMyPassword'])
        : null;
    token = json['token'];
  }
}

class DataChangeMyPassword {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? passwordResetVerified;
  String? passwordChangedAt;

  DataChangeMyPassword.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetVerified = json['passwordResetVerified'];
    passwordChangedAt = json['passwordChangedAt'];
  }
}
