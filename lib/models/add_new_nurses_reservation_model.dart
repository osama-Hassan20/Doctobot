class AddNew_Nurses_ReservationsModel {
  Data? data;

  AddNew_Nurses_ReservationsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? start;
  String? end;
  String? phone;
  String? reservationPlace;
  bool? reservationStatus;
  bool? isPaid;
  int? totalPaid;
  String? paidAt;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    phone = json['phone'];
    reservationPlace = json['reservationPlace'];
    reservationStatus = json['reservationStatus'];
    isPaid = json['isPaid'];
    totalPaid = json['totalPaid'];
    paidAt = json['paidAt'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
