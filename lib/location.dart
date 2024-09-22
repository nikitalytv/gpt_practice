class Location {
  final String street;
  final String city;
  final String state;
  final String country;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        street: "${json['street']['number']} ${json['street']['name']}",
        city: json['city'],
        state: json['state'],
        country: json['country']);
  }
}
