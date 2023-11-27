class GetAllNursesModel {
  int? results;
  PaginationResult? paginationResult;
  List<DataN>? data;

  GetAllNursesModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? new PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <DataN>[];
      json['data'].forEach((v) {
        data!.add(new DataN.fromJson(v));
      });
    }
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }
}

class DataN {
  String? sId;
  String? price;
  String? name;
  String? age;
  int? experienceYears;
  String? whatsapp;
  bool? isAvailable;
  String? shift;
  String? contactNumber;
  String? email;
  String? address;
  String? image;
  String? createdAt;
  int? rating;

  DataN.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    name = json['name'];
    age = json['age'];
    experienceYears = json['experienceYears'];
    whatsapp = json['whatsapp'];
    isAvailable = json['isAvailable'];
    shift = json['shift'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    createdAt = json['created_at'];
    rating = json['rating'];
  }
}
