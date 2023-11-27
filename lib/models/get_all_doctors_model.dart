class GetAllDoctorsModel {
  int? results;
  PaginationResult? paginationResult;
  List<Data>? data;

  GetAllDoctorsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? new PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }
}

class Data {
  String? sId;
  String? name;
  String? age;
  String? specialiaty;
  String? educationYears;
  String? whatsapp;
  int? experienceYears;
  bool? isAvailable;
  String? contactNumber;
  String? email;
  String? address;
  String? image;
  String? createdAt;
  String? price;
  int? rating;

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    age = json['age'];
    specialiaty = json['specialiaty'];
    educationYears = json['educationYears'];
    whatsapp = json['whatsapp'];
    experienceYears = json['experienceYears'];
    isAvailable = json['isAvailable'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    createdAt = json['created_at'];
    price = json['price'];
    rating = json['rating'];
  }
}
