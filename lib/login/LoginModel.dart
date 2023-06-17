class LoginModel {
  String? id;
  String? string;
  bool? success;

  LoginModel({this.id, this.string, this.success});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    string: json["string"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "string": string,
    "success": success,
  };
}