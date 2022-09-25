class User {

  int id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    required this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"] ?? "-",
    firstName: json["first_name"] ?? "-",
    lastName: json["last_name"] ?? "-",
    avatar: json["avatar"] ?? "-",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}