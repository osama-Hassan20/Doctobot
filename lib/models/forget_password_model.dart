class ForgotPasswordModel {
  String? status;
  String? message;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
