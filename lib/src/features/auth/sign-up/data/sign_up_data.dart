import 'dart:convert';

SignUpData signUpDataFromJson(String str) =>
    SignUpData.fromJson(json.decode(str));

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  bool success;
  String message;
  Data data;

  SignUpData({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
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
