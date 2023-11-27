class AddNew_Nurses_CalenderModel {
  Data? data;

  AddNew_Nurses_CalenderModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? weekday;
  String? month;
  int? day;
  String? startAt;
  String? endAt;
  String? status;
  String? nurse;
  String? sId;
  int? iV;

  Data.fromJson(Map<String, dynamic> json) {
    weekday = json['weekday'];
    month = json['month'];
    day = json['day'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    status = json['status'];
    nurse = json['nurse'];
    sId = json['_id'];
    iV = json['__v'];
  }
}
