class UpdateProfileModel {
  DataUpdate? data;


  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataUpdate.fromJson(json['data']) : null;
  }


}

class DataUpdate {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? phone;



  DataUpdate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phone = json['phone'];
  }


}
