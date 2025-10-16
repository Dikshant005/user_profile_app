import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.pictureUrl,
    required super.age,
    required super.city,
    required super.country,
    super.isLiked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['login']['uuid'] ?? '',
      firstName: json['name']['first'] ?? '',
      lastName: json['name']['last'] ?? '',
      pictureUrl: json['picture']['large'] ?? '',
      age: json['dob']['age'] ?? 0,
      city: json['location']['city'] ?? '',
      country: json['location']['country'] ?? '',
      isLiked: false,
    );
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? pictureUrl,
    int? age,
    String? city,
    String? country,
    bool? isLiked,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      age: age ?? this.age,
      city: city ?? this.city,
      country: country ?? this.country,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}