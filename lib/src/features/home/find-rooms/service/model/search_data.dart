import 'dart:convert';

SearchData searchDataFromJson(String str) =>
    SearchData.fromJson(json.decode(str));

String searchDataToJson(SearchData data) => json.encode(data.toJson());

class SearchData {
  bool success;
  String message;
  Data data;

  SearchData({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
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
  SearchDataClass searchData;
  List<RoomDatum> roomData;

  Data({
    required this.searchData,
    required this.roomData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        searchData: SearchDataClass.fromJson(json["search_data"]),
        roomData: List<RoomDatum>.from(
            json["room_data"].map((x) => RoomDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "search_data": searchData.toJson(),
        "room_data": List<dynamic>.from(roomData.map((x) => x.toJson())),
      };
}

class RoomDatum {
  int id;
  String roomNumber;
  String maxNumberGuest;
  String description;
  String currentPrice;
  String oldPrice;
  String discountPrice;
  String receptionistId;
  String discountPercentage;
  List<Gallery> gallery;
  DateTime createdAt;
  DateTime updatedAt;
  String? rating;
  Receptionist receptionist;

  RoomDatum({
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
  });

  factory RoomDatum.fromJson(Map<String, dynamic> json) => RoomDatum(
        id: json["id"],
        roomNumber: json["room_number"],
        maxNumberGuest: json["max_number_guest"],
        description: json["description"],
        currentPrice: json["current_price"],
        oldPrice: json["old_price"],
        discountPrice: json["discount_price"],
        receptionistId: json["receptionist_id"],
        discountPercentage: json["discount_percentage"],
        gallery: List<Gallery>.from(
            json["gallery"].map((x) => galleryValues.map[x]!)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rating: json["rating"] ?? "0.0",
        receptionist: Receptionist.fromJson(json["receptionist"]),
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
        "gallery":
            List<dynamic>.from(gallery.map((x) => galleryValues.reverse[x])),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rating": rating,
        "receptionist": receptionist.toJson(),
      };
}

enum Gallery { NAME, RAHMAN, SABITUR }

final galleryValues = EnumValues({
  "name": Gallery.NAME,
  "rahman": Gallery.RAHMAN,
  "sabitur": Gallery.SABITUR
});

class Receptionist {
  int id;
  Name name;
  Email email;
  Rule rule;
  DateTime emailVerifiedAt;
  String profileUrl;
  Phone phone;
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
        name: nameValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        rule: ruleValues.map[json["rule"]]!,
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        profileUrl: json["profile_url"],
        phone: phoneValues.map[json["phone"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "email": emailValues.reverse[email],
        "rule": ruleValues.reverse[rule],
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "profile_url": profileUrl,
        "phone": phoneValues.reverse[phone],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Email {
  KATRINE75_EXAMPLE_COM,
  LANG_ROSS_EXAMPLE_ORG,
  SHAINA_BRUEN_EXAMPLE_NET
}

final emailValues = EnumValues({
  "katrine75@example.com": Email.KATRINE75_EXAMPLE_COM,
  "lang.ross@example.org": Email.LANG_ROSS_EXAMPLE_ORG,
  "shaina.bruen@example.net": Email.SHAINA_BRUEN_EXAMPLE_NET
});

enum Name { CLOVIS_GOODWIN, MYRTLE_WUNSCH, PROF_EDMUND_STOLTENBERG_PH_D }

final nameValues = EnumValues({
  "Clovis Goodwin": Name.CLOVIS_GOODWIN,
  "Myrtle Wunsch": Name.MYRTLE_WUNSCH,
  "Prof. Edmund Stoltenberg PhD": Name.PROF_EDMUND_STOLTENBERG_PH_D
});

enum Phone { THE_12067604371, THE_12486371074, THE_7438842445 }

final phoneValues = EnumValues({
  "1-206-760-4371": Phone.THE_12067604371,
  "+1 (248) 637-1074": Phone.THE_12486371074,
  "743-884-2445": Phone.THE_7438842445
});

enum Rule { RECEPTIONIST }

final ruleValues = EnumValues({"receptionist": Rule.RECEPTIONIST});

class SearchDataClass {
  String checkInDate;
  String checkOutDate;

  SearchDataClass({
    required this.checkInDate,
    required this.checkOutDate,
  });

  factory SearchDataClass.fromJson(Map<String, dynamic> json) =>
      SearchDataClass(
        checkInDate: json["check_in_date"],
        checkOutDate: json["check_out_date"],
      );

  Map<String, dynamic> toJson() => {
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
