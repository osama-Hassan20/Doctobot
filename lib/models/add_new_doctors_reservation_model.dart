class AddNew_Doctors_ReservationsModel {
  DrdataRese? drdataRese;

  AddNew_Doctors_ReservationsModel.fromJson(Map<String, dynamic> json) {
    drdataRese = json['DrdataRese'] != null
        ? new DrdataRese.fromJson(json['DrdataRese'])
        : null;
  }
}

class DrdataRese {
  String? doctor;
  String? start;
  String? end;
  String? time;
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

  DrdataRese.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'];
    start = json['start'];
    end = json['end'];
    time = json['time'];
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
