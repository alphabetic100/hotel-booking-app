import 'dart:convert';

SignInData signInDataFromJson(String str) =>
    SignInData.fromJson(json.decode(str));

String signInDataToJson(SignInData data) => json.encode(data.toJson());

class SignInData {
  bool success;
  String message;
  Data data;

  SignInData({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
