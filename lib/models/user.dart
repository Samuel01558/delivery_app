class User {
  final String id;
  final String username;
  final String email;
  final String? phoneNumber;
  final String? address;
  final List<String> favorites;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
    this.address,
    this.favorites = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      favorites: List<String>.from(json['favorites'] ?? []),
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'favorites': favorites,
    };
  }
}
