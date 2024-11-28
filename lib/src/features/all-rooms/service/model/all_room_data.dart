import 'dart:convert';

AllRoomData allRoomDataFromJson(String str) =>
    AllRoomData.fromJson(json.decode(str));

String allRoomDataToJson(AllRoomData data) => json.encode(data.toJson());

class AllRoomData {
  bool success;
  String message;
  List<Datum> data;

  AllRoomData({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AllRoomData.fromJson(Map<String, dynamic> json) => AllRoomData(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        rating: json["rating"],
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

// ignore: constant_identifier_names
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
