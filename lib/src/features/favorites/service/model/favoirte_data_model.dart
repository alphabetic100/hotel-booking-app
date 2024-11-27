import 'dart:convert';

FavoriteDataModel favoriteDataModelFromJson(String str) =>
    FavoriteDataModel.fromJson(json.decode(str));

String favoriteDataModelToJson(FavoriteDataModel data) =>
    json.encode(data.toJson());

class FavoriteDataModel {
  bool success;
  String message;
  Data data;

  FavoriteDataModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) =>
      FavoriteDataModel(
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
  List<FavouriteDatum> favouriteData;

  Data({
    required this.favouriteData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favouriteData: List<FavouriteDatum>.from(
            json["favourite_data"].map((x) => FavouriteDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favourite_data":
            List<dynamic>.from(favouriteData.map((x) => x.toJson())),
      };
}

class FavouriteDatum {
  int id;
  String userId;
  String roomNumber;
  DateTime createdAt;
  DateTime updatedAt;

  FavouriteDatum({
    required this.id,
    required this.userId,
    required this.roomNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FavouriteDatum.fromJson(Map<String, dynamic> json) => FavouriteDatum(
        id: json["id"],
        userId: json["user_id"],
        roomNumber: json["room_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "room_number": roomNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
