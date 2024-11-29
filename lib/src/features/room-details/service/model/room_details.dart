import 'dart:convert';

RoomDetails roomDetailsFromJson(String str) =>
    RoomDetails.fromJson(json.decode(str));

String roomDetailsToJson(RoomDetails data) => json.encode(data.toJson());

class RoomDetails {
  bool success;
  String message;
  Data data;

  RoomDetails({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RoomDetails.fromJson(Map<String, dynamic> json) => RoomDetails(
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
  RoomData roomData;

  Data({
    required this.roomData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        roomData: RoomData.fromJson(json["room_data"]),
      );

  Map<String, dynamic> toJson() => {
        "room_data": roomData.toJson(),
      };
}

class RoomData {
  int id;
  String roomNumber;
  String maxNumberGuest;
  String description;
  String currentPrice;
  String oldPrice;
  String discountPrice;
  String receptionistId;
  String discountPercentage;
  List<String> gallery;
  DateTime createdAt;
  DateTime updatedAt;
  String rating;
  Receptionist receptionist;
  List<UserFeedback> userFeedback;

  RoomData({
    required this.id,
    required this.roomNumber,
    required this.maxNumberGuest,
    required this.description,
    required this.currentPrice,
    required this.oldPrice,
    required this.discountPrice,
    required this.receptionistId,
    required this.discountPercentage,
    required this.gallery,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.receptionist,
    required this.userFeedback,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) => RoomData(
        id: json["id"],
        roomNumber: json["room_number"],
        maxNumberGuest: json["max_number_guest"],
        description: json["description"],
        currentPrice: json["current_price"],
        oldPrice: json["old_price"],
        discountPrice: json["discount_price"],
        receptionistId: json["receptionist_id"],
        discountPercentage: json["discount_percentage"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rating: json["rating"],
        receptionist: Receptionist.fromJson(json["receptionist"]),
        userFeedback: List<UserFeedback>.from(
            json["user_feedback"].map((x) => UserFeedback.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "max_number_guest": maxNumberGuest,
        "description": description,
        "current_price": currentPrice,
        "old_price": oldPrice,
        "discount_price": discountPrice,
        "receptionist_id": receptionistId,
        "discount_percentage": discountPercentage,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rating": rating,
        "receptionist": receptionist.toJson(),
        "user_feedback":
            List<dynamic>.from(userFeedback.map((x) => x.toJson())),
      };
}

class Receptionist {
  int id;
  String name;
  String email;
  String rule;
  DateTime emailVerifiedAt;
  String profileUrl;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  Receptionist({
    required this.id,
    required this.name,
    required this.email,
    required this.rule,
    required this.emailVerifiedAt,
    required this.profileUrl,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Receptionist.fromJson(Map<String, dynamic> json) => Receptionist(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        rule: json["rule"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        profileUrl: json["profile_url"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "rule": rule,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "profile_url": profileUrl,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class UserFeedback {
  int id;
  String roomNumber;
  String userId;
  String userRating;
  String comments;
  DateTime createdAt;
  DateTime updatedAt;

  UserFeedback({
    required this.id,
    required this.roomNumber,
    required this.userId,
    required this.userRating,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) => UserFeedback(
        id: json["id"],
        roomNumber: json["room_number"],
        userId: json["user_id"],
        userRating: json["user_rating"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "user_id": userId,
        "user_rating": userRating,
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
