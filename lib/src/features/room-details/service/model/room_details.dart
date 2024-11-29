class RoomDetails {
  bool? success;
  String? message;
  Data? data;

  RoomDetails({this.success, this.message, this.data});

  RoomDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  RoomData? roomData;

  Data({this.roomData});

  Data.fromJson(Map<String, dynamic> json) {
    roomData =
        json['room_data'] != null ? RoomData.fromJson(json['room_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (roomData != null) {
      data['room_data'] = roomData!.toJson();
    }
    return data;
  }
}

class RoomData {
  int? id;
  String? roomNumber;
  String? maxNumberGuest;
  String? description;
  String? currentPrice;
  String? oldPrice;
  String? discountPrice;
  String? receptionistId;
  String? discountPercentage;
  List<String>? gallery;
  String? createdAt;
  String? updatedAt;
  String? rating;
  Receptionist? receptionist;
  List<UserFeedback>? userFeedback;

  RoomData(
      {this.id,
      this.roomNumber,
      this.maxNumberGuest,
      this.description,
      this.currentPrice,
      this.oldPrice,
      this.discountPrice,
      this.receptionistId,
      this.discountPercentage,
      this.gallery,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.receptionist,
      this.userFeedback});

  RoomData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    maxNumberGuest = json['max_number_guest'];
    description = json['description'];
    currentPrice = json['current_price'];
    oldPrice = json['old_price'];
    discountPrice = json['discount_price'];
    receptionistId = json['receptionist_id'];
    discountPercentage = json['discount_percentage'];
    gallery = json['gallery'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'] ?? "0.0";
    receptionist = json['receptionist'] != null
        ? Receptionist.fromJson(json['receptionist'])
        : null;
    if (json['user_feedback'] != null) {
      userFeedback = <UserFeedback>[];
      json['user_feedback'].forEach((v) {
        userFeedback!.add(UserFeedback.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_number'] = roomNumber;
    data['max_number_guest'] = maxNumberGuest;
    data['description'] = description;
    data['current_price'] = currentPrice;
    data['old_price'] = oldPrice;
    data['discount_price'] = discountPrice;
    data['receptionist_id'] = receptionistId;
    data['discount_percentage'] = discountPercentage;
    data['gallery'] = gallery;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['rating'] = rating;
    if (receptionist != null) {
      data['receptionist'] = receptionist!.toJson();
    }
    if (userFeedback != null) {
      data['user_feedback'] = userFeedback!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Receptionist {
  int? id;
  String? name;
  String? email;
  String? rule;
  String? emailVerifiedAt;
  String? profileUrl;
  String? phone;
  String? createdAt;
  String? updatedAt;

  Receptionist(
      {this.id,
      this.name,
      this.email,
      this.rule,
      this.emailVerifiedAt,
      this.profileUrl,
      this.phone,
      this.createdAt,
      this.updatedAt});

  Receptionist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    rule = json['rule'];
    emailVerifiedAt = json['email_verified_at'];
    profileUrl = json['profile_url'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['rule'] = rule;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_url'] = profileUrl;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserFeedback {
  int? id;
  String? roomNumber;
  String? userId;
  String? userRating;
  String? comments;
  String? createdAt;
  String? updatedAt;

  UserFeedback(
      {this.id,
      this.roomNumber,
      this.userId,
      this.userRating,
      this.comments,
      this.createdAt,
      this.updatedAt});

  UserFeedback.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    userId = json['user_id'];
    userRating = json['user_rating'] ?? "0.0";
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_number'] = roomNumber;
    data['user_id'] = userId;
    data['user_rating'] = userRating;
    data['comments'] = comments;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
