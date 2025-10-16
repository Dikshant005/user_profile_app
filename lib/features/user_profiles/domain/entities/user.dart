import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String pictureUrl;
  final int age;
  final String city;
  final String country;
  final bool isLiked;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    required this.age,
    required this.city,
    required this.country,
    this.isLiked = false,
  });

  String get fullName => '$firstName $lastName';

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? pictureUrl,
    int? age,
    String? city,
    String? country,
    bool? isLiked,
  }) {
    return User(
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

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        pictureUrl,
        age,
        city,
        country,
        isLiked,
      ];
}