import 'package:gpt_practice/location.dart';

class User {
  final String name;
  final String email;
  final String pictureUrl;
  final Location location;

  User(
      {required this.name,
      required this.email,
      required this.pictureUrl,
      required this.location});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: "${json['name']['first']} ${json['name']['last']}",
        email: json['email'],
        pictureUrl: json['picture']['large'],
        location: Location.fromJson(json['location']));
  }
}
