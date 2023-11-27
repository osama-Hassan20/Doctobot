class AddNew_Doctors_CalenderModel {
  DataCalenders? dataCalenders;

  AddNew_Doctors_CalenderModel.fromJson(Map<String, dynamic> json) {
    dataCalenders = json['dataCalenders'] != null
        ? new DataCalenders.fromJson(json['dataCalenders'])
        : null;
  }
}

class DataCalenders {
  String? weekday;
  String? month;
  int? day;
  String? startAt;
  String? endAt;
  String? status;
  String? doctor;
  String? sId;
  int? iV;

  DataCalenders.fromJson(Map<String, dynamic> json) {
    weekday = json['weekday'];
    month = json['month'];
    day = json['day'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    status = json['status'];
    doctor = json['doctor'];
    sId = json['_id'];
    iV = json['__v'];
  }
}
